Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005D20B810;
	Tue, 24 Feb 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936216; cv=none; b=PuQoO4V3wJUp4BNRLIdNdh8saFbJOW1k7MvAE3e1j19dto+zzNKSqLgrNydKsmAGCgvwT9zQUrV5xhkThXa1xCH0I8mV4EmmZxLElC1XiG+co79MxGzQsAAjhTGIhoK1Uz+10bVG7exTMQiMkS8IL+6fZbK6pcuysJZ6z8qtUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936216; c=relaxed/simple;
	bh=Yl/VGytIieGwM0BISDEWxFLX3fzNIgNPNqKISwqD1cU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HLL9ytiVVNt4X3B/xPyW7h/Q7yPFVTBfdeK98cRv5wh88IHKthO7CHkpZCTgo621VKuCc3P80sO95FoeFRBDi8VY5f4/hB7DeAKwcRpKrzB7cgz9lOKq/voPAiAleLxprk2d8t9+HoEk+RjPaJnhql1Md5kKIU7szZtec1fwT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXFUzSfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXFUzSfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3D5C116D0;
	Tue, 24 Feb 2026 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771936215;
	bh=Yl/VGytIieGwM0BISDEWxFLX3fzNIgNPNqKISwqD1cU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KXFUzSfl7z91kCddmEqg8BKAbBUJTInPx66AUTW/oiNKBJIDGElE8t3hMDkBaStrx
	 TsBfGUVG0/wY9JeHjk390d+qELNxsbGrZD0rtLQWiKeglDhtPmHqf3WTGH9w+RviLs
	 U2HM/ahri0SRYwgjNOHcibUhJdvfbXHmmOhlpbnQHmH3QZ2D7nTe9d7anp499GktH+
	 DHf+gFi/+/6KHwXITcKaRojh3AKa4AL0hJ8rnmIXEwciNzX9CnYTTbFIDlA2tvW5OJ
	 fItBHlXv2anrgHQHQOldHk5MS+sA39R4Usum7MEt5Zr21iPYB82/YhJVZ0doP1/NOi
	 7nOQcs44hOHuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: axis: artpec9: Fix missing soc unit
 address
Message-Id: <177193621300.95965.15818734205475984010.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 13:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 24 Feb 2026 13:27:40 +0100, Krzysztof Kozlowski wrote:
> Fix W=1 build warning to comply with Samsuung SoC maintainer profile:
> 
>   artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
> 

Applied, thanks!

[1/1] arm64: dts: axis: artpec9: Fix missing soc unit address
      https://git.kernel.org/krzk/linux/c/1f8fb2a87b58c2d12b7a9c817b8e781be90fe37d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

