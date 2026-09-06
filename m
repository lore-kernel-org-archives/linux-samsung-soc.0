Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8067523D297;
	Sun,  6 Sep 2026 03:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665862; cv=none; b=pUeTxYx+XpWHhdqh/fbuIQsBUeTIKX+cJ3J7iK1390UyfBWOvJ62qZxzUoFFhVGzzukAbOHpiSLPiw6BUP1hUTNtipjNwxMRVGT59rb/EJxi09hO5gNMWbqBKutYjx2HqTfXFLzdSP1Bho+BCmComf46A6HeedAmZFmmqw8PcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665862; c=relaxed/simple;
	bh=zHGqmoMnNLLwctQrmU4s9NMU+5YCR9CxS7sqvavlik8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4ZKWGjwLrLrAyZ9NxrG9VS9U4WDa+A5v22RxGpU8RId5xgxU3+hEqHuDI+Bu0y1lZ09hr+MbdalqN8wjgKrCgnEeibH+2T5H+2Q45d9SusrJ5JN+yuKvr6pFw2bTq+I0vVR0iA90ar/vSgvR7Ixnq/daCksGXeZTJFv0oAEVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IgvIgoaS; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IgvIgoaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UC
	HeaKLx08osv1pSzR6MrGj8R6eTrVPOj6BnZUIFe6E=; b=IgvIgoaS5TkL9gKndL
	vHDVctwuDI+VIykm87bm9B58jLlGVMGUPdJ42fAooKfFdfW0+6QGTwwgEIZ8IpHZ
	fPgc3fAm1x2Cjk8XOG+90DKP4xXaAnfUahkcH5hfqk+Y5iWdqOTj3Ry3M8Pcc34S
	FUYfFPPbsPuqivDhfskcRklBU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXX9zV35xq8xjGAw--.37724S2;
	Sun, 06 Sep 2026 11:36:54 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi@etezian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: s2mps11: Propagate OF provider registration failures
Date: Sun,  6 Sep 2026 11:36:04 +0800
Message-ID: <20260906033651.84082-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX9zV35xq8xjGAw--.37724S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF13Jry8WryUKrWruw1rJFb_yoW8Wr43pF
	ZrAFy5tryUXr48Gas3Ar1xWFyfK3WSyFy5GrZrCryfuwn09F1rCw18AFWDtFn8Jr1vgr12
	vryvyFWjkF43ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRAWrtUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRbut2qc39Y6qQAA3m

s2mps11_clk_probe() ignores of_clk_add_hw_provider() failures, stores
driver data and returns success even though DT consumers cannot acquire the
registered clocks.

Return the provider error through the existing lookup cleanup path. Skip
empty lookup slots while unwinding because S2MPS14 omits its CP clock.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: b228fad50c00 ("clk: s2mps11: Migrate to clk_hw based OF and registration APIs")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/clk/clk-s2mps11.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index fa5ac8f673f6..94969d97d6e9 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -192,8 +192,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 		clk_data->hws[i] = &s2mps11_clks[i].hw;
 	}
 
-	of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
-			       clk_data);
+	ret = of_clk_add_hw_provider(s2mps11_clks->clk_np,
+				     of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		goto err_reg;
 
 	platform_set_drvdata(pdev, s2mps11_clks);
 
@@ -201,8 +203,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 
 err_reg:
 	of_node_put(s2mps11_clks[0].clk_np);
-	while (--i >= 0)
-		clkdev_drop(s2mps11_clks[i].lookup);
+	while (--i >= 0) {
+		if (s2mps11_clks[i].lookup)
+			clkdev_drop(s2mps11_clks[i].lookup);
+	}
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)

