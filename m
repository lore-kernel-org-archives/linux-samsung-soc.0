Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250736CE0C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772770517; cv=pass; b=fUdlwlWDK8ZBkRzKBFoWhttvJisGBkFRRhm6qsjdg4NTCDGwYVyL7xfpPm4EkGOJzT1E94NcWjF9IlMuOk6V3nP+PjYGRb/3boHamIMRmdAKtv57ppwTe1CML0QxYJWXZn0MHmei36xvXjUq3jpccnm2AWkooYIveMtEJE6/3v0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772770517; c=relaxed/simple;
	bh=nFIzFCEGdHvUoDkDKio798vd3KSOQ+BKfInvObQxhB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FooNf9ZsvBXdUyYI0dUxUk1HwpdOfgVeCpdnJSkNZYMI7fkyybcKLX32hWXsq5++3P9CLntKRTLyYYpyIDh4BvLN1p3Q23ce7XzGhuWouVhVIpwrOsg5Zn1sF7p3he5alzkBr2Py6XTKxLhcVRt1ffTaL8ODnwn0jNJWk+JEII4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuQ4LlqK; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuQ4LlqK"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1077133466b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 20:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=D4Zgj2eYCVBJY7/h+j5E6j243rqq4Qe1TtkS1dLIZk2DNtjPYfrUuKd1fzGIdUgXfe
         kSqjkBcy3OsGi6HGyn2fELXwNYJdWAJKYxOyVKtZydU6s/nXfKqWBxwhM9XilTb1MACn
         LFXbOWeURtvW4CF90PK6IkOc2+Mz0hcynix9rUlLnFsiK6ADknErRgICFfyYF61iEmWI
         DpE/gYJK8x1YXhlpBzsx1MVO+JQOnXyPD781CMMKAOUGFDjbYqK1LMSuZZ6EGF5y7w+U
         onKv/7v50c18/q24Fp6JcX+65BUaqGqe9LN3n0MPsNXLYGqlPC74I7+aZ5UKFEUs+zdw
         9hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=BOARvctA88aDqrDjzH7uwskaJk9Mv5SiZq3xf+6OB60=;
        b=HhZ93XzEcpzN5sMZ9NWQPqgsGpwG60CIFv3D+LMhPpU2PbND7kdiBVpjCR3QP33FQe
         dPVbLxycRdBAg0BKVne4G3YS8ojNYR9nNFhw5xBmln/mYpGzzyNKCVuBarzn2IUVWaT9
         pAyyb5F3/Nlmgegh6DtTPed3Wg0tb5nhaWS86c2jxn/qOi88TlioFAtRIi8HLYzg6Bq6
         en3JpOVN95q3RYqzHYrw98tsX1/YA4N7xKHlSP/6S74vKGNgUIka7VDHHDjeTCXYZBY+
         O2raxslWKkozZplYDCgo5PnOMDeFXB8KiuXzdja2o4VEuPsp+BxhO/ziP/J3YKyLPLpx
         BzAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=JuQ4LlqKe2uZcIT/kABI6GSC7b7JlJX0AZeWvKQeJVhKDtckoPQr5Td+YZWWzTMb4h
         nFgshoPtGycmuLuGPGLDJ2ovrA3Tfo8HjD1Ebkd3RPgLibjIVYo3nYNBSBFUDsdcmZqs
         9mihTwD9YwD6MQCiaxJn9BHpsClO/pJR27TRcRn4MbXAi7uigzte9NdrLWDyWl+m/6SE
         D6xdF+22cGQwghpTK4JeBUnGXMV2zkOMJzakkGTQfDO8Fei6yCPCfK8CFraWWesjFDyJ
         T8g59HWhFCLeHNlgXt43enDZiBLyaWUVh0kyx4K22hVBpW1QpDSIcvh/e800Qlj2x5X8
         g7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=Ohr0Y9a3oF4/v6A7Ka7kNts35UYWpBijeHQmv2MWo1DnkKFS1VaR0skckhQloSepqA
         AhtVGNwLZa9u7KtyR+PoePtTl2TUxa7hLJfvys/O4XNRVWrKkX1bSpYQ8FPXLCCR8561
         6Sa1BWeNddqlK0itdlewF9BqU4ZOTGYvMRXorlp+ZX9+af43PS4Vfwz4SBbUOzyTYHEJ
         Syg7z+Afu5wcwbK1rDdIuZBg7a4McwLmksmJJXVJ+McGcSE7/iLHRIdoRSy6YmtfvkVf
         K081+LBMPDOXv84BhuQntmnLrW+qzv+rfOZJbEDf5v9T1ZlfD1nkDBGtqnxpD0X+lRo/
         Y3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2J7S/nn4ZQWREoezxrbHOAnkx6/alGudWU9zaknWtdy5KyCb14r+Njvq5p70YX1RNoEjPTHGTHrrRy6g/bwSBxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywRI3KVTZ0B5oFi1XSsBhXsu/OVzU9cK4suw5+xo+wQf3GH9Su
	qA9MS31uM0evz5iCm7yr5aPCADzzhNYMHSEHhmAswKy8Ub+yT+SCR6uArkEaj5DuT4+/COANQXZ
	lryGeQoEFqRo84LJMaYYUR82vdWR8IH4=
X-Gm-Gg: ATEYQzxG43x5p1X9EEw4TdDn9v1sec4lrhk6YLfW6gNXkuvXxXg7mKLMP5f3rguoDys
	qw6jH7fn/0hxwW5A2/tmzQX1jBlUHknGNDy9n6NR+Y9qcII+XdbtANHd4V+Uu5+vjD/Z7BllPkx
	IQ+GkP2E5DuPb8cZvM4ZuB7bVKwsr+KNlx0eTupQ9LIi2RpQZt2JcKjjVMrvQrd6K/V5QncLxnV
	OPjEGEftfy0aBkQ/EGNERMswfIhia+vupbYCDtyby2FTi5BRq/V+MyIyMaZM56GQjVK/eOele1p
	MvmNKA==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand
