Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F328227B83;
	Thu, 28 Aug 2025 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391201; cv=none; b=Kb9DEcIy4BQyyoYfmG1/xH8g38n6X0MSeTushNXmswVR9Pgr1oKJH0Ze1Qp9pnQnUIjO80VIwhBLn4rbglazLq1xzGZ3rTqnMnqT6GiEExaUCtCTtI/637atYC5jIH6RjrJAoCE6J2vvMDgoSBYT5Hp81ZhZ3cusLLw24Eh1EoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391201; c=relaxed/simple;
	bh=nZTT535RfyXPcNBRflR/RKIqbWf0jF5aESO8lp2wvoc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dxum7ckWOUnMXghjDtqBL0074posI5M93m3ukyGC9KIpv25CPjVUGfZtabDn+bnhgb4BY2JCQS1RZqZCEws71B1fWxx2ErVutWPvrgLE7SbWmXO4MmBnqSldwLuKzfN/SZqgwBAAawiJq/gHmqg+F6ZEhc+MhyQ5srBWmLATs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK6o2o7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK6o2o7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762C8C4CEFA;
	Thu, 28 Aug 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756391200;
	bh=nZTT535RfyXPcNBRflR/RKIqbWf0jF5aESO8lp2wvoc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DK6o2o7hQb39YCj7Se7T/Oaju7Jz9DdnSK69P2J5Y4v3z4pv5/NiVgd61NkEzUZpv
	 lo63HA7tMPXLmj3TqV07fCRCN6ktOnIbGPUfnmEIeTlt3VUiykXK/CbITsSBXTHbSN
	 YLUmsoSOqdPmZ8kOnhkUZ6zXmUsz9etsCxMraTWv8vKeufvGLiZeiay9YbEmDT6fnV
	 UMnpx3+IA1LDg8ozja/LlNWJpLxA2Xk8CW3OoAZawG5Y4VsFne0QQbXzjkzuKP4Hig
	 tX3xzQ8pYlyPY3LVpeQECcVwtBxsfQZCf6VdM1Hd5tfyZ79mp7/Gq3UdicBvVJ5vHC
	 PniYkScWUDr/Q==
Date: Thu, 28 Aug 2025 09:26:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, pankaj.dubey@samsung.com, alim.akhtar@samsung.com, 
 krzk@kernel.org, devicetree@vger.kernel.org, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, shradha.t@samsung.com, 
 ravi.patel@samsung.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
To: Inbaraj E <inbaraj.e@samsung.com>
In-Reply-To: <20250828083926.16849-1-inbaraj.e@samsung.com>
References: <CGME20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896@epcas5p3.samsung.com>
 <20250828083926.16849-1-inbaraj.e@samsung.com>
Message-Id: <175639108979.1621797.4942360795464575731.robh@kernel.org>
Subject: Re: [v3] arm64: dts: fsd: Add CSIS nodes


On Thu, 28 Aug 2025 14:09:26 +0530, Inbaraj E wrote:
> The Tesla FSD SoC CSIS IP bundles MIPI CSI-2 link controller and video
> capture interface. Add nodes describing the MIPI CSI-2 link controller
> and video capture interface.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
> 
> Changes since v2:
> - Changed generic node name
> - Fixed node ordering
> 
> Here is patch link for v2:
> https://lore.kernel.org/linux-media/20250814140943.22531-1-inbaraj.e@samsung.com/
> 
> This patch is dependent on below patchset
> https://lore.kernel.org/linux-media/20250822002734.23516-1-laurent.pinchart@ideasonboard.com/T/#t
> 
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 540 +++++++++++++++++++++++++++++
>  1 file changed, 540 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/tesla/' for 20250828083926.16849-1-inbaraj.e@samsung.com:

arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12640000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12641000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12650000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12651000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12660000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12661000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12670000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12671000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12680000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12681000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12690000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12691000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126a0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126a1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126b0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126b1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126c0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126c1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126d0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126d1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126e0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126e1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126f0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126f1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']





