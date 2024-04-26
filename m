Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F913E052
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123590; cv=none; b=Sy6cWx5vj5ir29uhs1H4+oBeUk+6VDgLJf7ZVyqo2iNni85QmK6ZN8QlQV6WjIIAOXwfBbOf1ZRo8XmxP+BSxVuKbhqAnsX47cLJN3ZLA2/IRS4THWMalPtp1l0qZlraN3JRlY1qpa70irWfcpATEt29/Epc2oKrJkoxMVSopBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123590; c=relaxed/simple;
	bh=Hahu2lWmHobYZzXBDCNNbnolJfAs8n4gH0zk1CT+pRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=qYjVsMRq89lthupmhCeZ5NKE6qi9ZX7eEXEYY9FSSFcLyPMUGs7JhX8ACXmIBkqg478ZxThnbZcSmZv/018CHZPcEzH9oLd7hp6F/M8hmuu2CGN+OZiioEuN2CyZ0pFl5tp0MD27id7tLO61g08jqF5DOrbMg7wMxyviAZlYH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N9G2iMQk; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N9G2iMQk"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240426092627euoutp01f13ea282421ea375577f04f73925c730~JylIcaAXk1154311543euoutp01C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 09:26:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240426092627euoutp01f13ea282421ea375577f04f73925c730~JylIcaAXk1154311543euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714123587;
	bh=/gN1XfdnNIwlyEXOxgUrP1Jreo4fLBZ5hZiCe6ZgYo4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=N9G2iMQkY662K2xAZ3/rVuP0qEQRpJQWZDGF1snNq1fyyVt7K7thnDXSPn4kq7i7n
	 ADxdpKaNeu44iLBN+zTwbk6DZGwG4/lfWHrmB1zhRGhDVfHGr1G3wftaj/GfOlKxKm
	 ZgsGvKm4HJS3tsJpGJS9yXSXPWyMLm0zWlUxmfHc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240426092626eucas1p1081e6648d084e46b1b5505a9f214dac4~JylH7bRWN2842128421eucas1p11;
	Fri, 26 Apr 2024 09:26:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 39.2F.09620.2437B266; Fri, 26
	Apr 2024 10:26:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247~JylHfCf-01571715717eucas1p25;
	Fri, 26 Apr 2024 09:26:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240426092626eusmtrp2b92da2c2394bcd42d2784b0c87619038~JylHdroqQ0550905509eusmtrp2O;
	Fri, 26 Apr 2024 09:26:26 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-2b-662b7342383d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.8A.09010.2437B266; Fri, 26
	Apr 2024 10:26:26 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240426092625eusmtip255132645e8c30e80961bbb405cb1b9a5~JylGrwPWf2970829708eusmtip2f;
	Fri, 26 Apr 2024 09:26:25 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, Bjorn
	Andersson <andersson@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Date: Fri, 26 Apr 2024 11:26:15 +0200
Message-Id: <20240426092616.4187022-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7pOxdppBrP75S0ezNvGZrGtw8bi
	+pfnrBaLGsQsJp7/yWZx/vwGdotNj6+xWnzsucdqMeP8PiaLtUfusltcPOVq8X/PDnaLw2/a
	WS3+XdvI4sDn8f5GK7vHplWdbB6f+k+yety5tofNY/OSeo++LasYPT5vkgtgj+KySUnNySxL
	LdK3S+DKePj4C3vBUZ6KCwvDGxjvc3UxcnJICJhIrLs7nQXEFhJYwShxsIeti5ELyP7CKPHx
	xSYo5zOjRNepXewwHd+/X2aCSCxnlOjZ0cUE0Q7UsndrEojNJmAo0fW2iw3EFhHIkLh5dz87
	SAOzwHFmiZO7b4I1CAukS2ydvIQZxGYRUJVYc+QzWAOvgL3E9CvTWSG2yUvsP3iWGSIuKHFy
	5hOwW5mB4s1bZzODDJUQuMMhcXfmOqgGF4k9Cz8zQ9jCEq+Ob4E6W0bi/875TBAN7YwSC37f
	h3ImMEo0PL/FCFFlLXHn3C+gMziAVmhKrN+lDxF2lLh3/hELSFhCgE/ixltBiCP4JCZtm84M
	EeaV6GgTgqhWk5h1fB3c2oMXLkGd4yEx69lldkhgxUpcXjORaQKjwiwkr81C8toshBsWMDKv
	YhRPLS3OTU8tNs5LLdcrTswtLs1L10vOz93ECExep/8d/7qDccWrj3qHGJk4GA8xSnAwK4nw
	3vyokSbEm5JYWZValB9fVJqTWnyIUZqDRUmcVzVFPlVIID2xJDU7NbUgtQgmy8TBKdXAFHTl
	2rtIo/oJZ0/1TbvDpVMTVspvvufMnapLm8y6yu+yZTflfZF8k3r+aHN0SO6Cg+etdmVfKGW4
	cYpr+dOvwuwLQ28HH956UOnt1/crN9cHBMr6rplpyml8pir3UWhtRdvbsn+LkqfMzt739dbX
	jxkSP18HrJNlC1wf1rzg//7nQeKXmuw5Ge8xv07aq/RbSnDn9nmlC1+2x3i68v/gmmHM8zpo
	MsO7n67pPWpxgmzyHDNfz/z19sTuQxmWx3jcp/yq1brxmUtnqyCHZwSTxcnlvcar1a4pX2SN
	uvXcb0dlJ6tn2aaPabF6W5IURT8b9DJMXWq1anptIuvxD5fr3qg/1ztrGf4xeeWJ7Xn1j5RY
	ijMSDbWYi4oTAeMQ7yTNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xe7pOxdppBpOOMFs8mLeNzWJbh43F
	9S/PWS0WNYhZTDz/k83i/PkN7BabHl9jtfjYc4/VYsb5fUwWa4/cZbe4eMrV4v+eHewWh9+0
	s1r8u7aRxYHP4/2NVnaPTas62Tw+9Z9k9bhzbQ+bx+Yl9R59W1YxenzeJBfAHqVnU5RfWpKq
	kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8fDxF/aCozwVFxaG
	NzDe5+pi5OSQEDCR+P79MlMXIxeHkMBSRom3+54xQyRkJE5Oa2CFsIUl/lzrYoMo+sQosaF1
	PxNIgk3AUKLrLUiCk0NEIEti3oQ7YJOYBc4zS9xo2M4IkhAWSJVYtO8cWBGLgKrEmiOfwWxe
	AXuJ6VemQ22Ql9h/8CwzRFxQ4uTMJywgNjNQvHnrbOYJjHyzkKRmIUktYGRaxSiSWlqcm55b
	bKRXnJhbXJqXrpecn7uJERg324793LKDceWrj3qHGJk4GA8xSnAwK4nw3vyokSbEm5JYWZVa
	lB9fVJqTWnyI0RTovonMUqLJ+cDIzSuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0t
	SC2C6WPi4JRqYFr2qmXRG1bD+lObVE+2KWqtdV/aIvt5ia8A532FJ20bKlvmBXH+53h6bM4E
	jSNRb3q/bFriv8Dy5VPndyLuXx8YB9g/Oj5lt3fr2auaE40FP284b+3zmU3aNJGT4xir9OTW
	wOUqRnPkORztcsJ9HLdkPT+neuU4v+idgyu/p90S26G7ZkrbsagpG65mHJ+nUXr8tvXz2tpH
	J5m65B7+/MHGvpVntsrd+r5dv8prZFOnTe481abAsUZM+CNDgOg8Qz2ZLbbJc228GPcknRSJ
	ltwZvOLtO9FGDsvtEqFLDebNseaa0zAzw+jgi+VLtsh+lj9ZHNnx+80f/TMtC5i5H2quu3zP
	7Q3P/3XyQhq1Z/4rsRRnJBpqMRcVJwIAHLTZSiQDAAA=
X-CMS-MailID: 20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247
References: <CGME20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247@eucas1p2.samsung.com>

Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
module driver") this driver is instantiated as MFD-cell (matched by
platform device name) not as a real platform device created by OF code.
Remove of_match_table and change related MODULE_DEVICE_TABLE to simple
MODULE_ALIAS to avoid further confusion.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 503c6f5b20d5..e2968784d307 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
 		.data = &exynos_clkout_exynos5,
 	}, { }
 };
-MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 
 /*
  * Device will be instantiated as child of PMU device without its own
@@ -237,7 +236,6 @@ static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
 		.name = "exynos-clkout",
-		.of_match_table = exynos_clkout_ids,
 		.pm = &exynos_clkout_pm_ops,
 	},
 	.probe = exynos_clkout_probe,
@@ -248,4 +246,5 @@ module_platform_driver(exynos_clkout_driver);
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Tomasz Figa <tomasz.figa@gmail.com>");
 MODULE_DESCRIPTION("Samsung Exynos clock output driver");
+MODULE_ALIAS("platform:exynos-clkout");
 MODULE_LICENSE("GPL");
-- 
2.34.1

