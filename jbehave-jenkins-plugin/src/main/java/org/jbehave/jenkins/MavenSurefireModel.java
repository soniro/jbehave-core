package org.jbehave.jenkins;

import org.jenkinsci.lib.dtkit.model.AbstractOutputMetric;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MavenSurefireModel extends AbstractOutputMetric implements Serializable {

    public String getKey() {
        return "surefire";
    }

    public String getDescription() {
        return "MAVEN SUREFIRE OUTPUT FORMAT 1.0";
    }

    public String getVersion() {
        return "1.0";
    }

    public String[] getXsdNameList() {
        return null;
    }
}
