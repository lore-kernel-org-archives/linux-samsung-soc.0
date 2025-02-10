Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECA2580DF;
	Mon, 10 Feb 2025 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204560; cv=none; b=PPYX9WehzHq4KiSC1bAqSJTjZC0cqFMZjbB4JwNlG1JprD0CVk1oNJK8eMKvuEMbwJ3X6fcAjXWGGUrotrL6zWycM//rBxP73ZVP5CsHsdAuyAhf4h9i6b9CLuTd+U1u8Ha9jLpR+X9h97jcV8T9TEBaXkJ0OZdUvbSOvVvmXeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204560; c=relaxed/simple;
	bh=UT/78BR2tAyyzFGH2npZWxW5hNSCyp7d3rnhQpVN6iI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OJsA/Rq3XoXgT8Kk4wfTDeqfEW3wMzzc1LT3h0IBsUWzw9Jh1H3PwEECPVcBKJW42CU62LPl/YaH3RG85+dQm1f8l3k+SzVB577GKTP/rWUgaqzyVxzUbVCqELm00iqMvw/un/n0oFVVPk2WCjLw1qsmgKvvW2irRL3xYybqW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7n6IUv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7n6IUv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F2BC4CEE6;
	Mon, 10 Feb 2025 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204559;
	bh=UT/78BR2tAyyzFGH2npZWxW5hNSCyp7d3rnhQpVN6iI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b7n6IUv72dkvCZEDwaA47QdPLbfeIfJaR0lwF/ejKiMkPdSsK5qABjH3YjdW6QcXA
	 Kun3rTfRL9iEVrb0nU6aor0O4R6j76DmG28rbFsDLmWRFHDroh4Jbd6t7asgD2DFFb
	 RDzZVLbXR+MfyUoqeopqJ4c0hY55LWYHjC9tn9SOYtUp+TNLGi0ud0zHnaSpio+AJF
	 +oCTW+nrNWOLbdZrtw5qVJihdrwDThykyFdPas+NqFcYhjyYYiWXcVEYrC5OJUUzTV
	 x4FVXKv/PyLWGrUeTB25wNrJl4L5aLLE6Npf0BI/T6AJZW+Uw9V9utzKkdiXBawQo3
	 4I9SOP9geB2hQ==
Date: Mon, 10 Feb 2025 10:22:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, 
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org, 
 vincent.guittot@linaro.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, willmcvicker@google.com, 
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
 Catalin Marinas <catalin.marinas@arm.com>, ulf.hansson@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>, Will Deacon <will@kernel.org>, 
 arnd@arndb.de, kernel-team@android.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Message-Id: <173920411592.476427.15574016492470186426.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes


On Fri, 07 Feb 2025 15:56:42 +0000, Tudor Ambarus wrote:
> Define SRAM, mailbox and ACPM protocol in device tree.
> Enable the mailbox and ACPM protocol in defconfig.
> 
> Bindings for google,gs101-acpm-ipc are proposed at:
> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4
> 
> Changes in v4:
> - rebase on top of v6.14-rc1.
> - describe in the cover letter where are the ACPM bindings.
> - Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org
> 
> Changes in v3:
> - ACPM: don't specify the channel ID and type in DT: the channel ID is
>   discovered at runtime and the channel type is always DOORBELL for the
>   ACPM interface.
> - mbox: update #mbox-cells = <0>;
> - rebase on top of v6.13-rc3
> - Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org
> 
> Changes in v2:
> - update nodes based on the bindings updates
> - update mailbox and power-management (mailbox client) nodes to specify
>   channel type (doorbell or data) and channel ID.
> 
> v1:
> Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Tudor Ambarus (4):
>       arm64: dts: exynos: gs101: add SRAM node
>       arm64: dts: exynos: gs101: add AP to APM mailbox node
>       arm64: dts: exynos: gs101: add ACPM protocol node
>       arm64: defconfig: enable ACPM protocol and Exynos mailbox
> 
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
>  arch/arm64/configs/defconfig                 |  2 ++
>  2 files changed, 27 insertions(+)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241220-gs101-acpm-dt-6dcde166530a
> 
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org:

arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /firmware/power-management: failed to match any schema with compatible: ['google,gs101-acpm-ipc']





