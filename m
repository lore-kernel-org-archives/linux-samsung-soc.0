Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCD3148DD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151621; cv=pass; b=F/EEcpIglkTas86o4sve9RoeQC0lWTmTRgIxPevcsdqjo8ZFT8rz2CwQT0AR175nxNfim5DlreipXorr++sL6tziLZgY4fTBPNQTHhWf2zF9+JlKbV7z2XKOVEZT5JIsb2Of/GYXQ9jD+1NGthKbhCS/68g+CwKxUBVsbx4LyI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151621; c=relaxed/simple;
	bh=xJIizpowMvzwIxEMfksjLr0o/68e1fz2uZMcWo33RFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FL+PZrcFQkaKnVbA0zRy2jFTbAe9jb+tJue32zNxeZVs8wfp6T/0aWj7QtSxjTA6qcUQFv/VibAKCGnsrIQ6CYbEsmPVHFz9/9wjun+lJbNCUmnmdFCtxVrcuPa6dG5FSrVYVn5BPkRz5BBzRDGd4/JDmRyJEf7EkJ4KNePNazg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GC0mKCPV; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GC0mKCPV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so1472042a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 04:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151613; cv=none;
        d=google.com; s=arc-20240605;
        b=CwXHoKL0xHXUJEmgcWPdvptOsi9nZoDobAlR0V8YPdLU1rOn3/TM/Tok9U5ubzhcc/
         9xtFdxOZg2qhCiwusxvxRvVVXgX4OTjbawBPaGCQ+4Fo8EvTjBc5kuqBL0N6MWofh8i1
         waGX1cOxlVMA7/wI4rjGo8djPg1kVVJWwL7r84k6b7weARRp3nHhCSlWmj7el2X1HmyM
         cygByIanzJHQ96epg3xsI6EmpqJnpZi+F1oHj7TKdpTp5UIef8KmPYX1DHaCM4pD5Por
         LPMBBdHLbQNYCdVL1fPCS69UI7QALDzuT32l4YG4JwxjahjDMaNbygBQLpQZB9RRj70X
         8ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        fh=766PekrS8Gje22v7L3jDc0RimEDHkALu+z2e2fE7QPs=;
        b=iTZGrLIaDYJMzOqUBJz8RVo6ClruzM5L96Mg0BuUs97mPG311e+T7naUBXnSIzCR/5
         SgBj+XkP1CPsxGMb+jSJLHBVXRXo0V1Ia20MHbrolD1grthbEECt/LJYFv6Uc8cM+BmI
         l/SN37qNprKommIBvStmh8R1HiqRN9SnHaUbddw6upoezQBHmpq8a0ACa7RVVUvmq8xg
         pvxfNRjU6+tWGJ0lI6iQ0k6OlFxKlPwybRwaNELFq/MhNrAw2gxfcITF3w1h4lHNhEt+
         iXJCRsDXAGGx/FXhodV7cXwzsVrLvpwpyTnrl+47ogqFemQh/QvNXFAPU1NvRKTv1T3+
         z2sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151613; x=1778756413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=GC0mKCPVF1/pxQ23dODKxdIWOKRp6HToWdMWNHglyqGXLFg11witGWgmPW4c/HkKzO
         PjNwHAWoUEThipLpCTO/58C6ZZAfmNKY/7S/FBdomqbwahBJYKwPkInOy/tLAOZLP7kO
         g1F8+mTAvJR62LyaNiMyK5ZFuzI79RJqzsJc/s32nh4gijqv6FZhRVEYJ3p2BHruyzul
         /o7QhKJOuRcfkqJIKCkZ0moyKu9E42q4WHCtKzBM+gcQf2xmcrgIeydduyTq+kSvgx4u
         W1fzU1+6VxegyDWYH4HcAm3qZyN0fFpU9dY8eHRNE/6+iZFNRLfIBCabsi94qnCK8me2
         bkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151613; x=1778756413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=dOTK6ofDklN8Kn/5EyyGZtDEOLp/pOo88iGrfo2SNwVBgVZy9s8FDiZH5VBXKC/1/L
         X0Wff9V696jZQtsfiGp/+0vMKTWPhDLvsE0qhKalyXQxRJ5PUljW3g5mLSmo2Lqwo8+b
         EqHbzn5aTFBaD04pEiO0yCAq3rD/I1PHIus/eNMYyrQXCZO3hJ7DGCMr+zPDcQxekXbh
         6dZXw1pQj+GsfnSecK0c392n71MCb3EHbdxXVgsUlz5BxuBuF8cLWYMuV1JCWCXtLdzE
         bOXBNH/B/Rnnbp8+b4IO8wykwWenyKat4QeoAJkV6Urve6/LFgwsJqYjIzIgNPi8Ld15
         etmg==
X-Forwarded-Encrypted: i=1; AFNElJ88s8l/Qehb7IS09j0WMtQOy4Rdm+SUaKoAuQt+makruhipWEuXJxGHzwEO6aOvZ4cbleYVBkHCcvjGd0ApXqYvew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy217ooxuzDrxMMBc6H2PkNhWbITEAhsSIJYgrxW3V/TF1O91Uv
	1frsjHll2xG/T+ApHekSqyiYVyGkbH0h6VfWUGVkFcqWF0PlA6qFttFenQqwRMbp//SolEASBub
	S5h5LW6TC5oMYAUB3Wb3zFK4VF0AAPCZI5+4+w9sJGE1XkJ5DyCIo1UO45A==
X-Gm-Gg: AeBDiesIfZ9DkKlY2pUr2So/C7GIE1Sywkx88koU3jXepcvNzzd9JgqgtEC4WjHG1OX
	CFkgARHAWdd6uoy9RJUDz1W8kteg3R6Iol77oI9OSETeaNsQEsP325HBXpEGqqrNSpfkkG+7bRc
	EzbpJjhDzS6+jwIPBN9NLrw7U6ogiUSfzxyFUP/LlQWtamkXd7Rhji8P58taRuK8KLOjyAkDMhB
	Vt9VPFk5nFbs4JA8kFO19Vfv9+/4sDeylh28fF+5YeITONbeBQ0GJQKzUpO8JhnsQj3/ZTJbe9a
	cXmzj00j4RG+Yr6Ts34eIXGZKijjBmAVACK74JpnCGE2b2uvDayEl9NpLfuXeg==
X-Received: by 2002:a05:6402:a583:20b0:676:d851:447e with SMTP id
 4fb4d7f45d1cf-67e0dbfa297mr864649a12.4.1778151613070; Thu, 07 May 2026
 04:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org> <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 12:00:01 +0100
X-Gm-Features: AVHnY4LglSrSyhxrD3_RZ-F9y2tAHPw4q5NwDa0ckqm4CO9WeIJhM2zzkB74KAY
Message-ID: <CADrjBPoxH8ZguPMygP4X_DDC4PCbGu5fR4UnfLV1Qd=UKQ5yyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 20:00, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document support for a mailbox present on Exynos850-based platforms.
> The registers offsets are different from gs101 mailbox, but the
> workflow is similar, hence new compatible.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> index e249db4c1fbc..c109c1f7af24 100644
> --- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> @@ -20,7 +20,9 @@ description:
>
>  properties:
>    compatible:
> -    const: google,gs101-mbox
> +    enum:
> +      - google,gs101-mbox
> +      - samsung,exynos850-mbox
>
>    reg:
>      maxItems: 1
>
> --
> 2.51.0
>
