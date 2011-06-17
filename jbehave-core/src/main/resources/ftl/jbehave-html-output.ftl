<#ftl strip_whitespace=true>
<#macro renderMeta meta>
<div class="meta">
<div class="keyword">${keywords.meta}</div>
<#assign metaProperties=meta.getProperties()>
<#list metaProperties.keySet() as name>
<#assign property = metaProperties.get(name)>
<div class="property">${keywords.metaProperty}${name} ${property}</div>
</#list>
</div>
</#macro>
<#macro renderNarrative narrative>
<div class="narrative"><h2>${keywords.narrative}</h2>
<div class="element inOrderTo"><span class="keyword inOrderTo">${keywords.inOrderTo}</span> ${narrative.inOrderTo}</div>
<div class="element asA"><span class="keyword asA">${keywords.asA}</span> ${narrative.asA}</div>
<div class="element iWantTo"><span class="keyword iWantTo">${keywords.iWantTo}</span> ${narrative.iWantTo}</div>
</div>
</#macro>
<#macro renderGivenStories givenStories>
<div class="givenStories">
<div class="keyword">${keywords.givenStories}</div>
<#list givenStories.getStories() as givenStory>
<div class="givenStory">${givenStory.path}</div>
</#list>
</div>
</#macro>
<#macro renderTable table>
<#assign tableAsString=table.asString()>
<#assign rows=table.getRows()>
<#assign headers=table.getHeaders()>
<table>
<thead><tr>
<#list headers as header>
<th>${header}</th>
</#list>
</tr></thead>
<tbody>
<#list rows as row>
<tr>
<#list headers as header>
<#assign cell=row.get(header)>
<td>${cell}</td>
</#list>
</tr>
</#list>
</tbody>
</table>
</#macro>
<#macro renderStep step>
<#assign formattedStep = step.getFormattedStep("<span class=\"step parameter\">{0}</span>")>
<div class="step ${step.outcome}">${formattedStep} <#if step.getTable()??><span class="step parameter"><@renderTable step.getTable()/></span></#if> <@renderStepOutcome step.getOutcome()/></div>
</#macro>
<#macro renderStepOutcome outcome><#if outcome=="pending"><span class=\"keyword ${outcome}\">(${keywords.pending})</span></#if><#if outcome=="failed"><span class=\"keyword ${outcome}\">(${keywords.failed})</span></#if><#if outcome=="notPerformed"><span class=\"keyword ${outcome}\">(${keywords.notPerformed})</span></#if></#macro>

<html>
<body>
<div class="story"><h1>${story.description}</h1>
<div class="path">${story.path}</div>
<#if story.getMeta()??><@renderMeta story.getMeta()/></#if>
<#if story.getNarrative()??><@renderNarrative story.getNarrative()/></#if>
<#assign scenarios = story.getScenarios()>
<#list scenarios as scenario>
<div class="scenario"><h2>${keywords.scenario} ${scenario.title}</h2>   
<#if scenario.getMeta()??><@renderMeta scenario.getMeta()/></#if>
<#if scenario.getGivenStories()??><@renderGivenStories scenario.getGivenStories()/></#if>
<#if scenario.getExamplesTable()??>
<div class="examples"><h3>${keywords.examplesTable}</h3>
<#list scenario.getExamplesSteps() as step>
<div class="step">${step?html}</div>   
</#list>
<@renderTable scenario.getExamplesTable()/>
</div>  <!-- end examples -->
<#if scenario.getExamples()??>
<#list scenario.getExamples() as example>
<h3 class="example">${keywords.examplesTableRow} ${example}</h3>
<#assign steps = scenario.getStepsByExample(example)>
<#list steps as step>
<@renderStep step/>
</#list>
</#list>
</#if>
<#else> <!-- normal scenario steps -->
<#assign steps = scenario.getSteps()>
<#list steps as step>
<@renderStep step/>
</#list>
</#if>
</div> <!-- end scenario -->
</#list>
</div> <!-- end story -->
<#if story.getPendingMethods()??>
<#list story.getPendingMethods() as method>
<div><pre class="pending">${method}</pre></div>
</#list>
</#if>
</body>
</html>

