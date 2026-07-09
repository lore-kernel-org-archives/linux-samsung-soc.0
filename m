Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E24219F7
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600297; cv=pass; b=uNQ0Yg1oJ/hZ2SRdtVCLlXnZS2I6EY2iLHytnCgRsn3Co46wr8y778A/NEKRQywTVuUc9p6aQlsCmNYf5E3xCZHWm1ae+n5DzBj7tpyrqGO6jWDovA6CdvSIkw8uMzKZ1ZKemwW9I0zneH/6PKADhu4NChV6aYjzYdN8LmH/9Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600297; c=relaxed/simple;
	bh=OPrV5O0AAcEk4Ax1DhMdeaFznJylTqQuB7qh4wuvTLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C48i3SqXHB7wFK4zGSe3rD1PhWFNRLM6/WJcXmpJXy7vUYdF1DXj8i8WTArKFZ3QdGBDQJN1YMixgHGeBNE5B5EtqInoacf9jzOMWE2BFJXZi6oVateYmdTzlewFtsVptrTrDiwgITKsiZeG6bmdhqGlZSzYUKhGqRwp0piwEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lybu6eBO; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lybu6eBO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15d5468673so205933666b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 05:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600295; cv=none;
        d=google.com; s=arc-20260327;
        b=U4fneaKAX389PGPm0Omo844jYjKFfeT7jwQ/aAV6Rk0ORaYPD/OyP3J7jGuuloYyKz
         LKYITWn7T1T9WX5pP6dC609I6LoJoE6OB8HTwlh1YrkZm4mq7KKnWg2L0A1HXfoAkMuP
         pM9mDxZNhrPAcphqAPCtSIe2ydPfKg04CCtf83X9YOQ5mRCwCNu3H39FKw+i50wGxid9
         Z0mkXHJcBdTRnVLZXQXCWAN802BpVGpPue+zpDEdS5VpZIVyp2WygkZUL8wfb825cBKV
         qPl0icLn9zPU435hwe7X5TfPmYIwp3Eo/wHch3NXJh5WXnqtXyW8euIsgSv/6serrVn/
         XaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        fh=5qXHDpvhMJB4k21dcE2pOLeRxFQh4T+M8T7ezyhPsAU=;
        b=mchJjV0NvH6rdbDTmGQDb+gJOk6Zhdk8lLbfcoq5keNyLIXH+WwMv5XMsF9RkwzKVR
         Tli/uvwjxiHRRghF77OSOV4KeG/dheayOjUckLBeA7T/8+dRhn64EEnnWPkp15xsA53x
         loK/UES/KTJPitXR3su8saw6dV4w74/PGfAWTpx3W8HzvWZjK4cuHe3NI+9U0cIIvBSx
         I7HtBVlDjQHco8Lqbv9zW5S0nSd73QxmlgmWI/5Pc1ix7HFRFrFtTmuYWCqahfmr7G2n
         F4KP044AGgThPScIXe2dcbJSlH4Db/2pm40XvAykDfoLeuFlV9aASYAyp49or4l0yn3h
         Y5FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600295; x=1784205095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=Lybu6eBOtgswFf1z/Qb/FpNL8v+ECK2mB/Ui1scFkiF3v4DdSbYLlY0raLU6q5HHJd
         dOIYtkgqN/dCmNmThdPScpA/0x+aZlL9r6fydWZ3EWhYVzrEtkrhnAlT9UNX3f7W9kEo
         Ul3tOtgCLrNtxjf6YaBvYHsI3EpY7Bf4odWIQ9NrrMXVkpJ+rtpydfdHo+rapddjSnzy
         JXaLA0M3k5SJTkaMn6kBay0gllHxm3lR73hTOL6hzzAz0pqZd4LG5zMqjTfhVjQTgG4r
         lizjkMxbWbeMhNij3cQ3yRj8IGPYazgQWsCJZCwz2mQM1UgvhkRVSMDABN+Hk8q1CxW4
         aG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600295; x=1784205095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=OZ0UfQGxHfB3fUJ5Jm9IGEvnI16p43YEurFTcX5BO9aUpd6Y7U9JRym1UH5GhH+yTL
         IEQ8SzucJ/OUo/H3q4xbdphC0KakMksgnRrkvkl3kDpUwDdNRVxuT5ZrM07MUlQ/eEX0
         ytJsQSQKMCnvv5gG3NeLNrx/tsWAgwy8CyITHV49Xx20frNqmxBXczGdZ7FQP+2q5Yg/
         C2MQiJrtiOURlwIyNP2Xh+zVkkAnWkOEEZSBrYSOE9yHOu5DVgLAL/8l4vPipNdQb1U/
         Spf3SI3Yrq51iw5cW50kEbdBThIPNs/nMZ8KrW6pbQADeCBkMPZ6iJgrR++l1qlRGS50
         TtdA==
X-Forwarded-Encrypted: i=1; AHgh+RpoPMg37T1rJbOsdIHyriOtoZyAvt2k8f9TdVw8VipX4hgMzN5ZjQ60mX9dBv7Ue8oe1UeykbPRD1RaAGcLavSdzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAF8aMfii70Ch0JMKCip+GPKNlGajiSwBlfAoKxt96Wdt9Mhxs
	i/Ih0XewWYq6rSEF2TFNisJrcA9kFdhZ/c4aMAet1ep7InEY/Uq5rNpZGD6cCBxrEYs4etPMt9H
	+E/roXkrrzYtR1x3dmjbtT/lWi+9h2GeGOF/kxsT7eg==
X-Gm-Gg: AfdE7cm2CabuGMaiPrgSIsEmt6Qi+NqeWByoUNEZKnnQG6zqNMx4WTHoeRxIsOpfHGz
	Aib0bsibF+AOupt9zQkpmizEZm9KKxIuK7dQvi77aWzWRTgPux6Plpf1HbKjwxuRlzi1/Y5KYve
	jMS6c8iiSWkwFLvZ/Zw6QPicaIUh/Qt34/r1UPLyseVV8h/rYRXZt2RWgcTKW/3YEtr3YtgOp0S
	d6Qop+oBiDlPwUPnAupRUtnt04mRQmJ9iuPYxiOXSiFodd3yEo6LzziXlVNPn6Xx12BTkahDS5C
	Y40kB+gcLkAlugDyGGsqH/UBfoTAyaY=
X-Received: by 2002:a17:907:e153:b0:c12:e178:9e84 with SMTP id
 a640c23a62f3a-c15ce105e4fmr233958066b.49.1783600294225; Thu, 09 Jul 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-2-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:31:19 +0100
X-Gm-Features: AUfX_mxCKOFC11f8Hhbav9vKUyI4ziXGCV1o3lFI4ikoQtGzaYsKy-SJPukLiaE
Message-ID: <CADrjBPoERcP+G_wqCUx2=3cbwniqiBqrtBAUuSxwBbisJWqQ9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add Samsung Exynos8855 smdk board to documentation
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855
> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:
> --
> 2.34.1
>
