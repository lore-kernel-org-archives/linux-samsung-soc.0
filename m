From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Tue, 26 Feb 2013 23:48:24 +0100
Message-ID: <512D3BB8.50807@gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <CAD025yQxOp1nd8N8K5wYco_o2TkW19fk_3jXHYHfVDnsDLR9VQ@mail.gmail.com> <512D2FBB.5090507@gmail.com> <3726480.lf0XiLbqs9@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:39184 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053Ab3BZWs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 17:48:29 -0500
Received: by mail-ee0-f50.google.com with SMTP id e51so2861455eek.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 14:48:27 -0800 (PST)
In-Reply-To: <3726480.lf0XiLbqs9@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tom Gall <tom.gall@linaro.org>

On 02/26/2013 11:11 PM, Tomasz Figa wrote:
> We should stick to the rule that compatible value should be named after
> first specific SoC model in which this particular IP version was included.
>
> So this is what I would suggest:
>
> compatible = "samsung,s3c2443-fimd"; // for S3C24XX SoCs
> compatible = "samsung,s3c6400-fimd"; // for S3C64XX SoCs
> compatible = "samsung,s5p6440-fimd"; // for S5P64X0 SoCs
> compatible = "samsung,s5pc100-fimd"; // for S5PC100 SoC
> compatible = "samsung,s5pv210-fimd"; // for S5PV210 SoC
> compatible = "samsung,exynos4210-fimd"; // for Exynos4 SoCs
> compatible = "samsung,exynos5250-fimd"; // for Exynos5 SoCs

Yes, that looks good to me. I'm just not sure though if there is
any reference to "fimd" in the s3c2443 SoC documentation. Or
is it simply called lcd controller there ?
