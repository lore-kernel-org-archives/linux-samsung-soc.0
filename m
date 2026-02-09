Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AC371063;
	Mon,  9 Feb 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642750; cv=none; b=JtHp2Sa+Pj/Ucjy2WRBa6tYJp/nDfshCyloGiVdDaVfRu+NVGzJFF6+PlTG9MI7I0eo/EJYSKPPXXz6bNugdExkYFCYx2icFpRCveKpSqEuqncTeC+dNq/et8WsIynoBMbCgGl0ci0s4PwDOMQjmUY9zDF9RLl/IQ9oeIyYSOQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642750; c=relaxed/simple;
	bh=N9aExl0QdCiYbiVPhIz5yp7Rx8Z537Hwe3rIuytsv3w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XpekB14cPgTDwZ3t48UM6Stmbhq5bPmYE1NDqcZELK5hawSlIZV8I1BZrwsHazuleFt8GkFd9YUDq++RpPaoAGgc0GQiBVZPvMM99ADh5bFKst6RYslTC31iIlzwoIEwQXzrgSeLr2bAVRH24ZQ4wd2CFtK2p3OebGoBRE3fxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hrU+gPGJ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hrU+gPGJ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 025112681D;
	Mon,  9 Feb 2026 14:12:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBS-aKCXI0ss; Mon,  9 Feb 2026 14:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1770642746; bh=N9aExl0QdCiYbiVPhIz5yp7Rx8Z537Hwe3rIuytsv3w=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=hrU+gPGJxhHW1H55qIMeKUt6fDl6x8ls4Q7fv4zfanPOx41n/Xx8XZccWSbcCAFdx
	 yzSRN7nTekNgXs4kgNxka/xzFOsdC2i8H74K6BvPEPY+88ikkKpKCSDPoCHQd94tn4
	 k97MZtOphAVcgX1aqx4fZGAP0k0Jx2ZfSHsZWLSWJCivg2Q44Vx41fN4kscdkL73th
	 +f6WuyTW4PZc3scxN8Szp9VKC9/ejEVAcp2rKG/1AD8en1LODDQoc7mFNO2Gjgxe2g
	 wa1Wjc2FUB8SggPjNVczhUtlJqXeR7ehpE48jsOXUJY7Kg0n9615dyFGqST7WjESY5
	 rfQci6HA43N3Q==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 18:42:19 +0530
Message-Id: <DGAGGT76OPJK.3NJVOK7LZTKT7@disroot.org>
Cc: "Kaustabh Chakraborty" <kauschluss@disroot.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH FIX] mfd: sec-irq: fix non-constant case labels in
 s2mu005_irq_get_reg
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, "Lee
 Jones" <lee@kernel.org>
References: <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
 <20260209040358.2123413-1-kernel@lvkasz.us>
In-Reply-To: <20260209040358.2123413-1-kernel@lvkasz.us>

On 2026-02-09 05:03 +01:00, =C5=81ukasz Lebiedzi=C5=84ski wrote:
> Case labels must be compile-time constants, but the original
> implementation used array element values like irqf_regs[0], causing
> a compilation error:
>
>   drivers/mfd/sec-irq.c:218:9: error: case label does not reduce to
>   an integer constant

This was already reported by lkp bot, and I have fixed it locally
already. Weirdly, I don't get this error somehow.

>
> Replace array-based case labels with explicit S2MU005_REG_* defines
> for all four interrupt status and mask registers, preserving the
> original logic.
>
> This addresses an issue in the S2MU005 PMIC support patches [1].
>
> Link: https://lore.kernel.org/all/20260126-s2mu005-pmic-v2-6-78f1a75f547a=
@disroot.org/#Z31drivers:mfd:sec-irq.c [1]
> Signed-off-by: =C5=81ukasz Lebiedzi=C5=84ski <kernel@lvkasz.us>
> ---
>  drivers/mfd/sec-irq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 44a1eb074a08..73a611ba0502 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -215,9 +215,15 @@ static unsigned int s2mu005_irq_get_reg(struct regma=
p_irq_chip_data *data,
>  	};
> =20
>  	switch (base) {
> -	case irqf_regs[0]:
> +	case S2MU005_REG_CHGR_INT1:
> +	case S2MU005_REG_FLED_INT1:
> +	case S2MU005_REG_MUIC_INT1:
> +	case S2MU005_REG_MUIC_INT2:

We're checking the base register here, so all other than the first one
is redundant.

>  		return irqf_regs[index];
> -	case mask_regs[0]:
> +	case S2MU005_REG_CHGR_INT1M:
> +	case S2MU005_REG_FLED_INT1M:
> +	case S2MU005_REG_MUIC_INT1M:
> +	case S2MU005_REG_MUIC_INT2M:
>  		return mask_regs[index];
>  	}
> =20

