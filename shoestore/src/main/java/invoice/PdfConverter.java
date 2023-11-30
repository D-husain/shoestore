package invoice;

import java.io.ByteArrayOutputStream;
import org.xhtmlrenderer.pdf.ITextRenderer;

public class PdfConverter {

	 public static byte[] convertJspToPdf(String jspContent) throws Exception {
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ITextRenderer renderer = new ITextRenderer();
	        renderer.setDocumentFromString(jspContent);

	        try {
	            renderer.layout();
	            renderer.createPDF(baos);
	            baos.close();
	            return baos.toByteArray();
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw e; 
	        }
	    }
}
