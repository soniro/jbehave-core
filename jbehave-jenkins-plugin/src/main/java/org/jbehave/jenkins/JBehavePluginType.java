package org.jbehave.jenkins;

import org.kohsuke.stapler.DataBoundConstructor;

import org.jenkinsci.lib.dtkit.descriptor.TestTypeDescriptor;
import org.jenkinsci.lib.dtkit.type.TestType;

import hudson.Extension;

@SuppressWarnings("serial")
public class JBehavePluginType extends TestType {

    // @DataBoundConstructor
     public JBehavePluginType(String pattern, boolean failedIfNotNew, boolean deleteOutputFiles) {
        this(pattern, failedIfNotNew, deleteOutputFiles,true);
    }

    @DataBoundConstructor
    public JBehavePluginType(String pattern, boolean failedIfNotNew, boolean deleteOutputFiles, boolean stopProcessingIfError) {
        super(pattern, failedIfNotNew, deleteOutputFiles, stopProcessingIfError);
    }

    public TestTypeDescriptor<?> getDescriptor() {
        return new JBehavePluginType.DescriptorImpl();
    }

    @Extension
    public static class DescriptorImpl extends TestTypeDescriptor<JBehavePluginType> {

        public DescriptorImpl() {
            super(JBehavePluginType.class, JBehaveInputMetric.class);
        }

        public String getId() {
            return JBehavePluginType.class.getCanonicalName();
        }
    }

}
