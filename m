Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79715560AC7;
	Tue, 22 Sep 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092296; cv=none; b=TSqJIW31tjQ3ihVGwQq3NPKCoKjdiBuBdiQKAGy3XscK1z1IFLUQuWzKSuNfFbhBUKcEGjrVaYOYHrS4p3wu2NhKEDgm8998c7PZo5JZAcN7z/4ESS8wuHf1jQTJZc7+sWnUPxma9bIshx88Y0U9km8Iilsi9EQQuxZijGbEqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092296; c=relaxed/simple;
	bh=0qgnCHCn7LLCDO/fgBGkttUucEGzM99e1pS+TkQ7sxk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NTEajd8Kr/su58n/VyDfm0yRlP3oUpdROF630rKfizmJMKVSv4YtjIDPEoNN3bJJVLFBLyB/rV1qIHI2MxVXI/rIdx0XQQQK/I2J9AAD5WBPc605unVm5Bv9CTf7QIUfG1306wasvfwYpWAvElArZQ7fFgjtS/XM0rSpFdI8DH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=sg0dLjtu; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="sg0dLjtu"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hq2Sj5lw3z7t9l;
	Tue, 22 Sep 2026 16:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790087141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nww4PN4xAeVToVmfMKLJur/GFwR8JfTvEvsrd75MdoI=;
	b=sg0dLjtuM8iAnCpaLE3A6JTj7UDijAHt0HTQ32vnC9d8ksmc4mRnUBY8VcScZ3NB03yTRW
	T3tvEBLGAYwQSwbq3BZ9wStOaHmynSAUFMNqhW4JSgttc+3hUGbSNezGxAaf5vr4t9GPQf
	rj7ilhK8bmRcPmYZQIyWIwB0wQrOIjrEUFJrTOejGV1r6OYVp1X6jOqLqsC18Nuxrzs65r
	3qE7sISvkLyk752gwjmErx9/RNqLVA8SAUNfNu/6YhCRDYSHnUu/6R1++fEnxebcLyAIZu
	UjsWOw9KXFkBN5HELT6ZX1i0YicnWuUPYFgEtO47BiP8w+c2vo1oQ7WXqWZvaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of alex@chimac.ro designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=alex@chimac.ro
Date: Tue, 22 Sep 2026 17:25:38 +0300 (EEST)
From: Alexandru Chimac <alex@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <1632826281.78215.1790087138262@app.mailbox.org>
In-Reply-To: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4hq2Sj5lw3z7t9l

Sorry for the spam, I had some issues with the mail host but they're all
fixed now.

> On 09/22/2026 3:15 PM EEST Alexandru Chimac <alex@chimac.ro> wrote:
> 
>  
> All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> to them, so force the nodes to have clocks assigned to them.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
> Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> designated for them, so allow the device tree node to include clock
> information for the driver.
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 1feb6a6fc690..e4fdedb29631 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -140,6 +140,7 @@ allOf:
>              enum:
>                - google,gs101-pinctrl
>                - samsung,exynos8890-pinctrl
> +              - samsung,exynos9610-pinctrl
>      then:
>        required:
>          - clocks
> 
> ---
> base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
> change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
> 
> Best regards,
> --  
> Alexandru Chimac <alex@chimac.ro>
