Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746C35CB6F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633657; cv=none; b=O+/XoE85kBS1osnYuTKw02+HQ3SvRFPt/yplxkcUAWAfekqYThgYla0Lz2WxpcPIMSgsNXsxdo2YVQ3iY1nrL9Ds0Ns3C9XGqtbNeq361sJEOv3q9qbNDNzfc0xkNXVB/kIHGNlWmQs+fJQt8qqxnqjbHQq02ZuPvs8ktUwUZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633657; c=relaxed/simple;
	bh=usU4AsKxYiL9wPQdX55tLEiVuRtsJkW47W4gt0QH30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gp5RkJhv3Bwziet1wefyBA7GS2FTCDCOjZBCVI9+CH6y+a//KC56/NRI4/p7Smo4g569JOkC6eBQWVX6APOx1rbTmPfmVCCySoToITqisKL9QAixwkukpHIV4lsoGucwuxPGwyB+u9HhiLp+rQZzTXLeMrigX2pRfJOkxH3HDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArhD8jr8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArhD8jr8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1408197a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633656; x=1773238456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=ArhD8jr84XISWVl9gGSrPW55hIVw3gBtgBKt477yhgWT45O36LWXe4aN0XIP6hcMj8
         mWAhK5n4JzP2AqnJsXs4O030F5lYx2A2hpJzmZ3eb6IqV5/CfnDzAHXTAS+t3L5l+N/4
         hmeJ5uEe1eia/mOH+QE6NdrbbXCZNK/H1oLcySWmwrRT7MsONmFNQ1nugQl70PiAwsIO
         UUuGDBikvkgVk5C+OJD9oxCwxfBKoQ3nsL1ApAwqPAg7EscfkUu+xwA5Oej/AXO8+NE/
         UwA9TY+F8i60eZH6hA7lFUTGC4B13JysNYlw52Dakhrzktky1O4vu/s5CIBbaeFaO0wA
         jG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633656; x=1773238456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=praLo8rhmk7XWzFGluIb1hEwCIm+Bibx1s4guojTMLPTYc+5AVVRqvGet2tsMuZChH
         etWyG9Rhx2J+LHlRDDnO3bgzqAv0OggkyXgH9HYDolSkzwvo821EYKJvR9jVLWwrjwyd
         em0kHNFZ1VaWsbMKZCOBzwMMDVHf0rN6ttwZU+uyhLqyMJzMdkeU9KhddQAT0mRPwXeN
         9wW0IyN7cEDdINVqNgrYSy6aMU2GG0WvhHnxZF69f6oLNPTSfhfp1ZujIMumbx1pWcRs
         pu4ujubYLrMXYKxBzbIxVC2/mVwlMBw+3cAvz2dBlteZleSm6yEtYjYXRc6Lh5g5sPZR
         npZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdYQCfsZFF0uF4Eih45nZeYC7De6Bz7sjvteZgraSaoI/GyzoBB4pYFzn6wDHq41/76plzLqP89OqlNvlQ/ScvtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLccYPqxhjqxmOrZ5jjuG96piOyP45cR5jEmdPatZ2HHht2wmD
	/ds99kSincmMyKt4xi4tiHZJHUOJNSgS5YVxF3BUiF2s0ZY1q2ekZ8js
X-Gm-Gg: ATEYQzxtO8JY69SA/Z/sOZY/C6df8ILUgcANvwOLTfX3TTvDD8JJ6j1T8rKYdvnYiDV
	+1crfIe2CzyrfT8ygQAU6hWqPMBkkrIRHz7/WVHjS9lo+zUOZyVYCO7oUzhxRysaQzxMLwuk0AW
	KyZzby2ZQxrakFZ9IaEYQ9RCsLqVeOuymr0u3EtN9hmmG9mR/Fn0lrXi2z9Ga3qLO8RlbiqIcWx
	1HXV9YemX7EtxT6Hm5h3OmXXtB8cStpy7qD6DJ+uWnSCa8ewrr8R7qyJVoSvh4iCOBm/yeiNx4R
	/dhKnl/iVdp6aDMjhFNd+7Phu8Q6uXXQDP6a8f4XQ7fuWOwB+l+tLbpoUY2sQKbWy5/qFEGbEVJ
	ML5swXaVqpHyE5RJUoyBgpm7c7JhYhtjESxh628X1fiUJCe4ZjunpU98zkX3Y2QxxxiWbM5lvk5
	5/4FslmIy2ChYLBCbZZLFG
X-Received: by 2002:a17:90b:278e:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359a69adc3dmr1844903a91.5.1772633655971;
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 13/18] PCI: layerscape: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:56 +0530
Message-ID: <20260304140329.7089-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e..43a28d9ea7b0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -410,6 +410,7 @@ static struct platform_driver ls_pcie_driver = {
 		.of_match_table = ls_pcie_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &ls_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(ls_pcie_driver);
-- 
2.50.1

