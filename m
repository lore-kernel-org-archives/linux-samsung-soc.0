Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD72E738F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087375; cv=pass; b=BUSzex5NnsJTwcJf4eEzLBwjLNCXP3/yb7D20enfjgQxRQ3z+smQRpvwVkJ4QqVYqMuEGMqT/woMf6ITeBz3oO0VtnW2QKpWSqaCCNfhM3cFImfyeyvaHtm67b/13vNrTNxfIfcOD86xQjYyF3s94xsI7COGfpFzaGTIqjIvzzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087375; c=relaxed/simple;
	bh=s9iYiLxHL7U/2B3sedn7a7chFI9A193m2Bj539bDZyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/ynushkt3LExyRxOsKm1zCD/GU/1CxIgI5WURZL7OkL7xu/Ywm5EpGcvjQQVJv1sK2ml5tow6YOXOOyyfPWBJiLNUO2RnWjXg+nuo4PgyR9vlmOUmgM2U1/RC4USxAwqML3gpeoN5/8j4tsDcMGaPwlGGqOnq1HVV4fTLYt0WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9Hhm9x+; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9Hhm9x+"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-87f4e914a45so2900727b3.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 17:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789087371; cv=none;
        d=google.com; s=arc-20260327;
        b=lx4OmxlXzsZ9PwUkVujLYHWE9/2ADD9oAI2CZyjTwi6LZqAXXtEdPWza+L0DIIzmP1
         /ZT+RzulcGQjLoIkhndebsjXjecWJeXG07uJEzPS1ooTb7Owy2wX6bJsyofVZInGc1hu
         SqihO3An2qTTj+8od2vI5e4dpWtjfW/WmIw0RFGXjQcve1o3MSvj87J8Zc5YHk4B7aiI
         DXhMj3fxEFJLfC0+Tfklm9B3OLBD2sQ20qF7uzGoE/l+H42zS7SlIKEZzRGdWScwvsMB
         tbezk3Cyn7BzbyufIXnnSPe2RGBSTKfL4sMlAWm16frPMVoS2m/u6+EnqYarVXtec76T
         IYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        fh=KvijY07XDJ7OosR2ds3QdF4vQoarrz31XTnnW9ben3I=;
        b=GI7Ip/EFgXBsxfQiURWzrwnl5b0LGbqdjX6pjhycG+t6wtRdLTeOZXyTXp1Ld6QHhR
         jiMD1s89YA6IgjHOksOa74pi5D+rRskwZ7MthBBl5zvXOx8vvqKNK3g66IP4oAuMy2ZV
         o1aSbl9gTHP2FzRdLoj9XJ0OvJs3RpycySOVOfleOCP21tP5o6O66TdIcL0dhf9JOcp3
         SdldQzOemUaL5/OVQnJ+myGpNuELasev6BpOofNNoeX3C0/wR5bepqv2QUlTJCJfT2kg
         Sbx02+nY4q5WbjCqPBBLn+xMolqQZckOyByFV71P1GK8bHVUP5Yuj2jqcHvxdZCvzJWL
         Y7Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789087371; x=1789692171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=s9Hhm9x+YDQG69tX0j8jBrKCIJKTZdwzTvn0Y461nXRP57BUQt1qB3MWpTro68tKY9
         mf6K0M6ThgvID8jGDZe5K8gPjy1urNMD/t7WQyREItsQi8rVeCWb55uY58yeQ4Bb9HqC
         BEVeEvOc8CerQqH6KtvRzTTpJC/nEenzz4qD2Jf1+BFeOtVTVokuzYfPBf5izs64nl+e
         J5ngxdJnsEqLv74TN2LFgWJG0h0eJsSQ5r2dml4UHMPvIjSnUlFeppxX8Sh/d0i7/aNx
         OtomYnEQDg7GQlnSXaLbdJnl5ItAraMNCX1ZNUNnIGfWbz2J51PLDselUWrwVquUrv0s
         m5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087371; x=1789692171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=H3ANz+3u4awxe6tRF4aUW95I080TlxxzaDlfU/AnugDaUSeLQdBDGsA8U8IWteV1A+
         z2aoMtRkYqvODpQ3dz9i54RXXbofEkEH6nFfWo3CZDZ1BjtOnje6kOZuxjEWqyCC6TM4
         knFtP5IALVBKa2jOUabH2oTcwb3WziLEyAmFLoLf4YnwsKalXg6d7pxu86s6s8VR9tqE
         vcL5zeJmpR5echCovc99TIu0vWtzIZeAnZkBwuGuuClzeBKQQhASlqdsn3Cu/A38lmVl
         Fsvhi+QKU11gQkbKk/qQoiTCKI7GQyHovTrhKTKTJDLnAbMf+391MNrj+WOqK8Y0xp2g
         gnoA==
X-Forwarded-Encrypted: i=1; AKwUvBxgY9Dp8QKRDgqDQgAeOQrrD+0RlKwsIPw4B/00/tp4FanZgwP8ZIa0QQgUb4L5sQ8olTZwibJqmMXQstS2UwU2HA==@vger.kernel.org
X-Gm-Message-State: AFuF++nfnKk73KDzFfdwvwcHqbljt6nvDCc/Ds4daoRAlSML8kaZ6rdF
	XTyLHq+JXG+AQRnGn9JYdOECO9cruYwq+UhVGu4ozIvUjFxXTxWWuidGk5K3jhkVFzLYnSDSYo4
	Rzb9JYirSEJfVoUIc0pxS82ug7RBHuxwC2WFIbHhRcA==
X-Gm-Gg: AYBFou0nTTQHP0XNKL4AuqtMOnE/rOV1annXX0iISwHDFI+ECZOMTkMDBUbnGcwTeVL
	vGj0IC9GqJBeQPe7s8bXfNb21IVGsRiKjTq/9wKJs3evB2ggAPXCUIT1u3h4e20s/MEWU8owb6l
	BN9KIF4H2YDo07QWmfvyyPvHdTvIM3VLlPcTZKFuNYH9b7qktbIk6x+4qd658KLBCMbRnl1efHd
	p7kqfj8H0Q5aS01ip1cbwaL7UxwLxXSiei6XZtkEXH6tHzDB88IvIkuNdk9xVTAjvchBeKbAfpp
	MDw03gyUznhXJk8ziwYsgVkdMFmZRrnZl4Cl+ZUStKpFIFcKkvSw2nIWsl1xO6czy9tywsc/Pp8
	Cv11g9kya522kSA==
X-Received: by 2002:a05:690c:660a:b0:873:5ddf:d862 with SMTP id
 00721157ae682-884b3873114mr9013287b3.45.1789087371068; Thu, 10 Sep 2026
 17:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:42:38 -0500
X-Gm-Features: AcwNN1WDjFTgB-aBDySNIcrpUgOjcJa8lLtJJ127JD23ekWYTtDiP3LdRVUZsB0
Message-ID: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region us=
ed
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documenta=
tion/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram

Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
needs? I can see it's used in the gs101 device tree like this. If
there is a reason for this, I think it might be a good idea to
document it in the commit message (probably in both patches). Also,
should "mmio-sram" be added as a backup option (after comma) in your
[PATCH 2/2]?

>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
