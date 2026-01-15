Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE123ABBF;
	Thu, 15 Jan 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444733; cv=none; b=pgsMd4q/L3Q/4B5RXDHN656wp2iS4zEWpEkIIgZ6q/v6/L8uKyytg0FupqsZ0toEwYX+sPPcgmi6PYM8eyWXUZmus6MRKVGHNL+YMKho9yItye9y5M4UuHfsjmZkqlVMLVSdv8hYqS23WjT8h2PvTsvt3wIIArcoqsJqamBsIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444733; c=relaxed/simple;
	bh=oENn12gp4biMpZo2V0vvyFxTaL+EjIOxeloVatFB0K0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=povpnXMy+aZhYRiNAttFIpVe0zz/eO/WSvtnssSEL+wGR7RV949fY2my70AlqVkptpWUpTWXhpA4XtPGlxzUWsuWxiNKzlJ1ZplmjhDKDpTINJVh86XMQxhGjkqIHaAOF7I25LzCt7Tb9FXCzAr6mq0IEtm46zNZUW50H8bHjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXZMsuU2hpD2YxBQ--.43886S2;
	Thu, 15 Jan 2026 10:38:38 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: dwc3: google: Remove redundant dev_err()
Date: Thu, 15 Jan 2026 10:38:00 +0800
Message-Id: <20260115023800.4142416-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXZMsuU2hpD2YxBQ--.43886S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1xtry3JF1ktw4kGryUZFb_yoWDCrX_C3
	48CrZ2k3yDA398tryjvr43ZrWUur4rZFy8uF1qqa47KFyUGayUXry0gF95Ga4xZrW29ryD
	urs8Crya9r93AjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUbEfoUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The platform_get_irq_byname() function already prints an error message
internally upon failure using dev_err_probe(). Therefore, the explicit
dev_err() is redundant and results in duplicate error logs.

Remove the redundant dev_err() call to clean up the error path.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/dwc3/dwc3-google.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index a19857bd6b13..2105c72af753 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -228,10 +228,8 @@ static int dwc3_google_request_irq(struct dwc3_google *google, struct platform_d
 	int irq;
 
 	irq = platform_get_irq_byname(pdev, irq_name);
-	if (irq < 0) {
-		dev_err(google->dev, "invalid irq name %s\n", irq_name);
+	if (irq < 0)
 		return irq;
-	}
 
 	irq_set_status_flags(irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(google->dev, irq, NULL,
-- 
2.25.1

