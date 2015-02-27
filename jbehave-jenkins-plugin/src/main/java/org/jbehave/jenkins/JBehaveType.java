package org.jbehave.jenkins;

import org.jenkinsci.lib.dtkit.descriptor.TestTypeDescriptor;
import org.jenkinsci.lib.dtkit.type.TestType;

@SuppressWarnings("serial")
public class JBehaveType extends TestType {

    public JBehaveType(String pattern, boolean failedIfNotNew, boolean deleteJUnitFiles) {
        super(pattern, failedIfNotNew, deleteJUnitFiles);
    }

    @Override
    public TestTypeDescriptor<?> getDescriptor() {
        return null;
    }

    public Object readResolve() {
        return new JBehavePluginType(this.getPattern(), this.isFailIfNotNew(), this.isDeleteOutputFiles(), this.isStopProcessingIfError());
    }

}
