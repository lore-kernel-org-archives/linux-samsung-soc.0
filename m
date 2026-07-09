Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B3242D88
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602674; cv=pass; b=PTGZ3JRWCdleFYNp/kOvr3VtYsk0xeh1ZLDHllhTjoUsvHWKMf1fJa2qmMrpbUpWbrhYdHVWDtakfgXyWCQdjF1N/FbC1S6O8HpdEgQWhwjcg7eDxAePEEzoqEiYahVwxhgVUds02DfFtjdA9XyKAa6iHtHY8FvZa9AEaWwDLJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602674; c=relaxed/simple;
	bh=VsdkuYcnq534k/oBdCgtwjiHv0Cz+Yckus4BQnntf0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCyEy/f0TIRqugZpLd2CRI8KF51zzmO5FwxGdamulrBz+xI/ANyGfT7H+QpKtOcuqQxEWj4BHNLQ7Uq4MY8Nke3Xx1dzA+h6UoyrA8pIiqK9AXVPi4DBszEuf8y9OQjZ7VPAElbIHHmbENk4Fwp7gROoCmICrjOunncoZ9qiB9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmjQPRfv; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmjQPRfv"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so1246218a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602671; cv=none;
        d=google.com; s=arc-20260327;
        b=Yt1+B4l3At4c88TDKRPbQM2/ROs7NTukDXn2aih+TIui2VGAqwI+bL3ODWSaX4XvKJ
         UTqWqExTOYXD7jDpjfxsyIhBHKs0FDo+4c8IzFe9drwDQE0Og72bTERoNyUIHGkedvA4
         wqGjVyA3oe4fE+sQiGKjPOe4IfIFKt5iHBdijfL8s5rjEqNTQ6U3aJIodAq4Gfh9ZX6/
         CMAn2KpNlVZSc8J5fTc4gHsZ7cG5zvBt55XNyCcjWx1AYub0LU1NKjEuATpbrm+EEc7i
         OvRHOSCEOQFr4mRPH2jVwfNaKccFuv/nnNH4BSUWA9Hf66NW3EOkrIsogRmtXnOVnh3q
         /ZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        fh=jopsxoeKO5sDpgmdURBB1U8wX9HxRvfdFCKj7blZnfk=;
        b=OANehoZxUmEfp+NqcHn/jfJeIuRYEYUv+GO/QpuXd9rDLt8YhHWVBDBsaxC4sTHc8P
         lGKXYCgAepp1XgJ628OPn5abs3WVn5PVXtArWdYFcOiPavr+7caSqwn1SYZmwhNvPy8O
         8Ek2yTrs/K2zOXcfDmVL3/TJPfLP8YUNWXNieMCSGpfK5NBZ5q2P/cmZAwBdm9TiB7tr
         y88midv4DTonDjkbkDw7nFx24D0cYHmF4BzlLsjHGGCVK3KAwdzGwW4MM7lhEPjIFhH2
         yWNg3VgICMfTRYybZLIGEO9yGv5hBGQtPzi0f/VVLd6rq8d+lYSOTdPkIWNAB1s+0dSu
         GZUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783602671; x=1784207471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=dmjQPRfvLmKb7MAmQN4yQ7F5N07K6mXn+x5xvrhyz1a6aLPVNgv5tDh7MPOQKp+o3s
         4z2R776WVMpF/D4BEHJIUQT1bAe8oL7ydk4BFhyfVuC9NZgouKBXNcXwThgcPfeZByo9
         QpAqIV4wxczt9QbG+ixjjFhtSvJpvI44cA26hTTc+g550YMiKxXZesOgFZDtP1iMxoiA
         AnYBgPXaPmk+PuEhknh4EMPpDWZMDkuMKm0A4EmlCWuS22Ne7uSXuhSgki1IVJMBZmWa
         X9qK3ol3H7SCJz75mi1zCOSQnDwKvCN4IZtuRFsD0arSLGIcWk11jzx8pcSA/K2bHfoW
         xJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602671; x=1784207471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=ncPGKn1l+YmuDgpDwhjvjdMrXme8j2KQe09IKO6OcshI6ihMm6E1Am8JIHLHB0NM73
         NyL4D5Mb72ZANQPY4b/zZbZ+GOIVKEISVSLYA3MN56PXPhyd0rrHnFqYYnPotIO6wWrO
         go/3YLEuGWaU7Ix5j58h18gkX9LJEhs11NMJwbOeqFhh3Bhd+C6MLw/sw5HK91+R1bsx
         7Pg61bJlyGwsJC5DTuJRrE/vn0ZhiYOkG7vJY0H7JHgHEML0gFUlAxS3BzWj01K/3zG1
         U/sJTF89nxKAdrtKPnL4+rfhuDVD1Zg1STh2yHdsXAOdR31RowjuXBwhkVT+Uos3sTSv
         W5FA==
X-Forwarded-Encrypted: i=1; AHgh+RqTcVEzsKE7eTWZSNG0F510+iUMQQEzGzW3MsT7jJQFcKXTaAYpZpkV5whlLUXZBGpsyhL+otjsTStv9dSpDhRbZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcdxBM9GZodrE33qzeWWfhejRPPFO+GKodpc2aiPa4WCnk49C
	Jg4qf7Q9Wsp6BIwyfozYYqrge9ZuQ8gkYKahVxs+XEhPOuZzm2MpdCMvJqsB6+Mazf6Xw3T7Svq
	liSrhlb7yLh9bD0/NND6+mQd3L98gQhyzAMBOoy6VbA==
X-Gm-Gg: AfdE7cmKjbCMGkjPkbN6+3+D8d/2Ayhdqw19wjKc1ha31es3o2dH5rV79mNCMCWJ0sJ
	EdZiqtNIdWvfyLOteYHBko54Ec/1zbYNOozFSJaXPk6iT1PGSMxkBlo7obMwi7sEv6aqkiADsEP
	ccMjSOv2VyNkd31xZfeBU7YfIFOSZ0tp3C55D1no4mgqtSXEL1FvZV3Eri7bQoKrTvN3zggtWAL
	uBEnO+Rmu2uD7I0S6vgwjxyUnCLqrWYeu46DRpzPy/RQtX/CSlBZ3c3tdWdRcRnzx20nV7ty+lW
	nog/QMX6PX1A0+Vo1xOTKyralpZOTHA=
X-Received: by 2002:a05:6402:3214:b0:69a:b3ab:dbf3 with SMTP id
 4fb4d7f45d1cf-69ab4498173mr3121469a12.26.1783602671013; Thu, 09 Jul 2026
 06:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com> <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:10:55 +0100
X-Gm-Features: AUfX_mxsj7yhT66qMFeVreq-yvEDLAx2Oah2zZKlqJssK5rRTHtI0rAPHqjZj3E
Message-ID: <CADrjBPqc_hUJUCgRjk4F6RUVE+3qK7pxs5EGUTmH2PBs4R3Ymg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed
 reboot modes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2026 at 11:57, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
>
> Most of Android-based Exynos devices share the bootloader or its parts,
> thus reboot modes are most likely the same, however only a few upstream
> DTS define them, so add restrictions only for these.
>
> Google GS101 has on the other hand quite different bootloader with many
> known reboot modes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index d124f3ae9fbd..5bd39876e3b3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -176,6 +176,20 @@ allOf:
>        properties:
>          dp-phy: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos7-pmu
> +    then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|download$|fastboot$|recovery$))": false
> +
>    - if:
>        properties:
>          compatible:
> @@ -183,6 +197,13 @@ allOf:
>              enum:
>                - google,gs101-pmu
>      then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|charge$|dm-verity-device-corrupted$|fastboot$|reboot-ab-update$|recovery$)|rescue$|shutdown-thermal$|shutdown-thermal-battery$)": false
> +
>        required:
>          - google,pmu-intr-gen-syscon
>      else:
> --
> 2.53.0
>
