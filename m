Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB633B7B91
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633512; cv=none; b=WZsfmN5P8jCCZ+sc7WW3EjLHkI8l4/AYjql0bEo4hRet30GMPxYu7MPPmmg5pFuVkdtKZr/1RYMwenSb7edQTWYppGrJXumPOZBWIhNqFTYLGix/ElXKseLCM0pOUt4bg8sEflKS/aaIiua1hP6wtkPdZaI1y0ztuHvzStviTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633512; c=relaxed/simple;
	bh=sHoTROKxYE1tGVUpJLWua74R0Zndw2ipLQTGkl+pgQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTALzhtbLdbbfu/L+9U5zUthcdQ2w+AWajFA2Y+sEcMOmEQ8DWXRtZzUNgeasT28oqvkBmQQLeMvObttGPoZwce51MPHUD4MPoLOVfAzDtBUj3yr9Y9y2zg5rOJ0snhsVUusLD49Mdq5YN39DhkabwBJxZR24rvj7BOD9pJJ1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du/ORrL1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du/ORrL1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70ef340a02so3856662a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633511; x=1773238311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=Du/ORrL1KfTBAeWVAEeEMHu+KYevPCJ6Hj7d72cy1Sg3RSQZyYPfe4BFNhvn3Ex4jH
         v7deVtaig3lmuFmQ1d1X56TJ2Sw3DgPMjszSGhEx71BLkMV6IDI8L0FrJIVqsM3H1BLl
         BPeJg0D08P7mYdFOLvuehaMFhaTKJW/AFZ089F4/t+a1Fro3l5WeN1txpFu9kbXKYe8L
         Ah168yqLNqzgdPiRtP9RCGiEuywSiw00NKlVixnmm339pzFz3zaB2OaIjRn/uT4Al4aY
         zRS4CidaUayEOV7ATBfvBu63IPI2s9w5Rq7PL87YKpeKVPKDJTiKV4JclwAPN3vhGnE8
         X9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633511; x=1773238311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=kaXie9x5w8P6Zu8qyH40Tdy08Ju+ggGLS8PfgURoOlTctr8pNyRbFxxZCFj5bNToyN
         NFvGD4nzxOPiWXhsrR5JVMPScs6Wcerfv5sPbuhU7CY+F9Omo2djRTC9BuB/N+lgpJDf
         LKp7WYzcmJK3Fawr/JbO30ceVL7MorzZfXwKOnJvVdvnWaZ0Eei2jMlMuWtBTdnvcgVD
         tUuuiAKZBrf2VKTNPY5ceqqENEiYrtqNWP+PkKydq+/YbQUSCx/ZQ2t/kS8nBHsDKLdf
         pVen9pY3vKWM3eEVW1d3nc06xgkiv9M1J2UGkQJ+CFDf3hddiTvWD4Ex6bOinNT+0OX+
         pAFg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1WI6auLwLvv9oUNT3KhehPmjHmSDjC+yYNApvt2Zoxmv3uFrS3veHfjJreGcJCqHYjIgf4Y3PwjvJ5oTSdz2Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGInIsTt3G/Aj0aSh31w52RqJ8JYTJAe3Uu/74yFAMU2RFqCI
	sY6EfyKvK492PsxJElJ4jTN1pEb3acjiqmV8vA9KO1AGZlLybGUSrhyA
X-Gm-Gg: ATEYQzy5smD3a4RQdF9V/gD1bwGVIzRXP3wYNaXuoNkkvIwraT5H6h4vDzMkE+t2C7B
	uIP2DqKByN2Lb+lPkKTMavePank2bEn/ZqcfVcB19WWu3KzdTi14RhckwZNGxryremMxU1iaJMq
	dvvH8mjRoIxRkgrNBAmpZogzeWTeOdJUzfTsVug2w9U+9sT8LHItg2KTwN3/OQ5ovcCh+C3VYAs
	EwDz9ZcFS0Qhwgp8ojNW9ltMrL0uTR7jw0F+5Hsr8ERGgUAUr5F/M+xilyke7RwSh1LoWCq2/GC
	gycBbqpV8FUbMEMu2HrsyE08uUpr05Uq9oAwi9dyH3VxgWTScrJOqVYeOsXwvOIC1rS7XpUnDsz
	Uuu5ZeFnsdlTu4z8uHSbHyw7xCVNW7EYALXK15izAm6uL3FaHM1kK4fjO94mJIF2oDBeRt9fhI9
	WbxKhuBUiR02SxcRkpH4va1x+ALDl8jZs=
X-Received: by 2002:a17:90b:4e84:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-359a6a575e7mr2125758a91.26.1772633510992;
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
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
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 10/18] PCI: keystone: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:53 +0530
Message-ID: <20260304140329.7089-11-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-keystone.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..b5c0c690593e 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1351,6 +1351,7 @@ static struct platform_driver ks_pcie_driver = {
 	.driver = {
 		.name	= "keystone-pcie",
 		.of_match_table = ks_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1

