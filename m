Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B323B582D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633609; cv=none; b=A4QZR/aGLmY30z824qhW1C1me5CeowpSRmBoDKzJz6ukFAr1eak5dPitz/UI/c4zPodPDSfT0qRxmjMUxL+Z0k8zllzDdDG68M5CzEUO3i/ewJcx0Q5tf8rmRHXOjz/B94MrJUNV5LC1wALiMmhj9uWYbdF8oRAxHYUSE2HVTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633609; c=relaxed/simple;
	bh=hQjxT6/mWIpy+sa8NLac0lsuvVehqMlGMOKEzaLhgSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmN8ObR4aNYrAzkcY4eC5BwU6Kis9Fj5e9pSjcI7xGRCp9qvpOamP8EfP6q3tI5DHd3F8V8BGpZ/LxsnF7xqUa+N6w+FxYSjsIHj/xkS/FcyzUNviqOS3Ktt9Ou6hwJO4pb08hTx0DMlTlOq/wAYRGVITjbMqGkwwbX2FbFS67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWMeVW81; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWMeVW81"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82748257f5fso3610855b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633607; x=1773238407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=bWMeVW813iBYyWQUDrTidRXEo0VfwXLT7opiGAiGea9c48cT5a6WCwYwudlWWMPigt
         0PpZy574M1S64crl3NGETg2ke5yUA2s2HatW2B274oJn/w3GZ47CVF4O3wjPysyc4c0B
         Z0hUgppcVdENN+Uqf+jW+jRNjptJs0A1vOvJiOoAUt4SS9hRXhyDORF+3U8Fg8+4AJdQ
         cb9ZvfLpRgEE5NtC2D5jVJckfzgj+t+gC6lk0q+T1/zCEmoW3iAnIzheb3FBTfDx/rT/
         JTjw36zF9N9RTgARlbSqcAwOSmvsjtJalMjCq9CSI1WEzf4oC1JCTpSPrWmnOIGfMuq0
         C56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633607; x=1773238407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=YxVenGL6bE5plYailFTA8Y26OgNTfrr1RK8OPlC0OTqGoD7QOAx91/8xqcnkOus8yx
         +TnInplnf5UmzWKq30xpSA7rHp4y4DMNF/j/gp15BgaH3n0kyZgMr2LN0XiYP29IiAKt
         M6g2mkZSdSzkqMs20A20qkLtgR1bCAFk2DZFKgK2uI9uB2vS9N5D2HHHWPv4IYNuYdif
         juMeJjkMbMbVkByZ1mZlisak4jCISKLJqQVTrhQDud0fvwvRVGT4QCn8IHI9pcdaqEiI
         0uXWIHv8fFIfzy7TRsmx4GXLBsv2SLDg0WzSEPWYFIrjYL3YuHLhRVvQHVCXsj1lWjuj
         7ZRg==
X-Forwarded-Encrypted: i=1; AJvYcCVBvR0YSbyd0LudYJArmN50ymFVB/pDBGjn+YLvVT0x+m2vgd/pjdjE81teg4UCMnuzHgP0dhm+rEnicXdKjLsjcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSjLp1rRGtWlVMcnyapqXqbsgZ5TN1GQsAFsjUPiLL0MxFEud
	wgcR3Xhi4fMhVlOSh+lUsi7dHZzdKGCO8y4YoP4rAR7J2SbRxPUsqNjq
X-Gm-Gg: ATEYQzyaG74HiWB8O6/l/MwZR9I9z4qiCCPOFPFBjH6bYoWmTzwE/zNtO7qv0naf1HY
	QZVNYVRw1lfnS1kn5spPbKBfP3iOI3b6M0M9/gtSVULqcl8zyW9Tu9CiZrWoZavXScZgOmo+Abv
	7sVTLK/TIp1ga4B0OTX2+WFc9j7mL7ucXgIZ1c8KHQSGs1uup7c9vfDIp+2Q+uyxl701yQtpFx7
	3dgcsye0AhVcHIrSBZEhfDwik1cDAwmj24GjH2cHb1IVRKTLiP+xsPSatXQNs5930REmGD7/SoE
	KbBJrrYv4dAd+uVeNcF5pOrlai5Jh0vOek9ozYbnXgwGzgDPCVgYd83bu9+mWEUyYhEozrb4Gcd
	UDJFqyVbn37ehmIxzB9UrU8lg8x9sA1FJMctZiS6l24ifFEDw1oLmO6wNfyO47gyiloYlP8UxY2
	lmHEpT9JO/w91XuGuwNPYD
X-Received: by 2002:a17:90b:5286:b0:359:83a3:584d with SMTP id 98e67ed59e1d1-3599ce32dabmr5222786a91.6.1772633607253;
        Wed, 04 Mar 2026 06:13:27 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:13:26 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 12/18] PCI: kirin: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:55 +0530
Message-ID: <20260304140329.7089-13-linux.amoon@gmail.com>
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 91559c8b1866..bc905056a9d7 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -757,6 +757,7 @@ static struct platform_driver kirin_pcie_driver = {
 		.name			= "kirin-pcie",
 		.of_match_table		= kirin_pcie_match,
 		.suppress_bind_attrs	= true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(kirin_pcie_driver);
-- 
2.50.1

