Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6029E10B;
	Tue, 18 Aug 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058726; cv=none; b=XcUPXtAcTD0Pk5FMp8XOzf2Dsy3JPn0k6aVykfsTLYgpNhkncwMWkxEOtNUsqXkYSoIPbw3F4BU/XkGqHgtixHqFZmU0DRasv9gE/eCbLq0mACHwo4HsOzGZRcUDrprdwUujYEbT/xceXP5AcHv9raIdHwloKDPnduvCZd6ZWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058726; c=relaxed/simple;
	bh=uRONrne686OX/cJsaUhShmVzBciuAAPBA5LjELtZo+M=;
	h=Message-ID:From:Subject:To:Cc:Date; b=RqNYLpQ1QvV4CaE3pbU0Nue59JwYCWahg2H2hBvePXE0VCmbjPaTp455Y4ndJDNa/P42YekGJeHckHLwD0m7BthvUjSnlV4DaVp0dEIfT0HPBAY1VXk/AZj3thMeZdxVfN2+F5ZbHmyDhLPyJGFMKXtQAFW3BsVrIcjJtMGshcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ti8G52xA; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ti8G52xA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787058720; bh=c2fIO+Uh5lMfJ0TQG1bXbVsEM8un3Gt2zARsM5wCiBw=;
	h=From:Subject:To:Cc:Date;
	b=ti8G52xAXRbFVyXyz7uNPB666UClNNWdX+IJr8Bnd8/MTpTwjRyW/4PNJpC5veWjz
	 Vn/ZsiiEkiPhj2AU/Sif+zUHeOO0lN6LBtOj01hWkJ923+rqBw587n0sTb2g56crRN
	 uJQgeFa0VxEE6RJMKZ5sckkwUr35fr5Hao4ryWQE=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787058627t25s38j6k
Message-ID: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G3eqbtrbTrgpSgA9Ra87BwxRtPtbh3cRgEgFB8YusHM55t4oyMC
	 83ljhbN1E/dVTyneR0eJWsOVMC1HugibIBYUvhn8gSZ48kQIpRpathDCLt+x71cxbDhACG65heRU
	 X+nbWBDc6Fg3oaFr7hIElV8ZYe0SHg5zpsKlu9YK0N2TvZMbEiF312g6HLcb3ujABwetTsae2NcC
	 BEecL0hUgmmjdIQZel5Nyn1Jp+A6YSNJHDLhRtMioa2WEm2iV5PXCGmGZ9dXbpUAuEUkgDD3xHf6
	 HU+CJ8StlkmE0312wqER7kRjDp9pQMPPB4sYIU/rC9DEh4Agnzd2vtXKHb4ZK2XluMTxwqRwO4UD
	 t4c0nnqG9tScB+k1L/lV5j6GpyI7M5gRzhUjpfg936bb0yb8OE7te63RYNu7TSk/7GHTyHPQg9TL
	 tTw8yFPt8BPu0s48UvfCje0yhUBqbmjC+5OLCDvQX2Gs6iGigvqbeTaSro6jTMKMEKr2D+VtzVvx
	 x1NR5xl4rve+UwhVPW+jHTDKNdzk8CMbmROlU1StxouM9gzki0MJ1qhAzmxraNIYvrXhCb8+wiJ8
	 N0Uiou7iEGHDiSdSj5DfzWNNVDrNd2RkY2CcB7IZiu7vwitqGXUk6H89KKcHorrJLkIbyETV1kAQ
	 kB/7NobQlK92MFK0mg/2VIKfnBOdEs0WJ+lKfqjFxtLBx3gVPExNBmqqqb5i3Lom0ub45eVHaELX
	 JunnYFyzmE9uKu1ZMo4g5eciiskBwmO1Ax7ucyS7R6t+XHDXcsvddEDw/sylP5mxelGpq9To0w05
	 MqYOGKDoHgCY2qbR/0QkXHonG39QA5zED05sEFaat+BhTRuC+27U7yb8agKAHb6QTyZyXJ7s44V1
	 2UEygr2Eivdb+ZCp9+AQk83uTkNpiQxPwGsJqbryQ4VWTqMItOzIG5jjtCyAFqG2001EPSfijJR6
	 Rsq3jR5newlaa2vHXlUoKxv4/KsTsYorgMNr8E7NxUGWZPlSLPCLYnKbXgbceHd6VANdtuI0sP87
	 SNHE/y5f4DjsSDesAZXJwSYAxRDjvwyokHeRvnNoA+/0qa8IIDZfSLULl/hZnabNX0YoJD5w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Date: Tue, 18 Aug 2026 17:11:57 +0400
X-OQ-MSGID: <178705871733.291840.2722309413893899384@qq.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Keep clock enabled until adapter teardown.

The remove path disables the controller clock before unregistering the
I2C adapter, so adapter teardown can run after the hardware clock has
already been turned off.

Move I2C teardown before clock release (pm_runtime_disable,
clk_unprepare) in s3c24xx_i2c_remove.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1136,11 +1136,9 @@
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	i2c_del_adapter(&i2c->adap);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c->clk);
-
-	pm_runtime_disable(&pdev->dev);
-
-	i2c_del_adapter(&i2c->adap);
 }
 
 static int s3c24xx_i2c_suspend_noirq(struct device *dev)

