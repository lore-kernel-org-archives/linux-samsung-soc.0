Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19D3A9D8B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809016; cv=pass; b=sX56XMrLDXO294+LktiOhXHNSaBFLTplfDuojkWRahAIsPkxXDU/6xhsK0DpVhlwOKDieEqN+J9/re7ikAfPa6A0KZ+Biqz9wyoiWPif1xivOV/ODVX+HCh6OGgFGUEAtobMCpn2/FsV+jWSjiYHR2GUWIpj09KGZ4p682wnTzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809016; c=relaxed/simple;
	bh=goBpoJ28faoQ8XYgq6WhtkSGFlcd+YD90udJy5DZgkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJmtbIjP4IB8FGnrwp4o+UPTpKiOjzWtTWttbYhGRVINZKN87CKhN/8UhH8LOxmCXeMlyttYuMEw18oXC2C4KG8mgOLKFXJnqA1EGb4tdU5bP6MqAbyRtEtAo8MDtLa7jhWNEJbtf3dzM6zs3dyDkxNV9XeUMIgWtcR/rdQZQsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMOPNNur; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMOPNNur"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so2092098241.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 06:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809013; cv=none;
        d=google.com; s=arc-20240605;
        b=OhlNiJGkfLrdS7N+8QGsgE6od+Z+gqQ/aXX2CDAlFalpS2/upMKb6mJ4GRk5vuOrHM
         JR6lOmWhpV2yWEza0BzCt1OhTH3GE1B1dISy/w/TUFoRUFIlIo+6GSIgbOFECKn0tuXF
         bIHL/ZBIv0BLu5pawgifK62Nnxh3p5e3k3MYmfqQyEM6RDvU2caW4CjUpuuPsmnvnCCt
         N3xkjZ1kUOappEtET6EjbX5yjxcFdNQq9HlHQ9ZPE7Zm6VDMJCZ+7fDnn7j2KiwuTKrN
         Zw7S0hLb6rzIo8iW0iBk5nvh8HXmzfIyCz831S8SBQl/DDqydOTftvDOGbOmIbLxFtna
         XuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        fh=Ckcy/JlcZ0Y8MjXZfMPBmC0sBJcYV49BesBUUiiW7rQ=;
        b=L/6u3a1OFaoUMJjj/fCXJ196ZwRewm7mTssg0p8duIjOP6lm/BZSwo3yV56BAfexjG
         zDcB/JAD7mJOYrOIxgyJdztF10ngNVyo0XGG9vocV7DgFJNByS3iHJb/xIifNsH0Le0v
         dulillot2x2GizZsDAISVxrZoIz+ouqPgc8RJ/w3/8NBWmZ6BTie0o+ECR/demvlMvwO
         Uc8EtWPyoZpC4USRP0IvXbUjJKtim+Kh8QvfwsAqAmanDgUViF+3HcY0HXxC6jSo3K4k
         Wct5H5BhnGbgLvE71hCQduRCF0ylcB6JWYIr/44BIdRMn/Z+yGlJQrNJOV5i8+5wimZK
         mRuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809013; x=1773413813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        b=OMOPNNurmksofM6hthi26u33qkRP1VGQTiSNwb+x4OiJzXiPfZQB3Spv62Oo/6yEjm
         lMaibKVzkClOHXR4GED0quj9b4ipSiowfl9/TDAiDmWqm+qfzd5YdCAQpdApfMThn7Sa
         gxUAV1ttvtBcW34SyuS05nn8ktuTplgWJ3ydNw795GZoAvubaopYQi7zMoC8yfo/LkzP
         8Q6N1I+ZVEtgRm6Gu8aFfrjwypa+IOH9ZAKPym/Jn/SfoMbFZre8sb8MPpd5QNQ6LoDU
         H5EucT6+OWNJKTZaWa2ahOJIui8dHDBySrKGg+SdqECsBmoIVJ2UmbkHY5FtfONLXSEP
         r5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809013; x=1773413813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        b=kmQdVVB0+hqcabtdmMDD2AjOqNujxIJokJvPNYMK/EWsCPMfet906X25Lm6eJBK3iY
         8grO7UNSElNRIOs4jn7+UwhPTnIAa9dbgC01gyadp7HZiH42QYeycLFfyR8hzsDI0kpo
         QyLiSRTLoI9HUrB3pnzdTLNXb6rl7R3vijdKVQTF0rwmsqTYGog15M4EfTi7UppyMbC6
         nRoVy1aygll4hlIPQJRMNhe++k1Lem2Nz3dAqC1emlrGzXHVv4pZrMqa/4SdrO1WThTX
         cQ1QMJq8qZuhMLwrB9xA8l2E3ibKpwo13fA6m1q6aeK4064gjQ9pYaHOi2uS7M1AxEvp
         CatQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiogfq2wHS8+1i3jGi9q0M86C2uHQ/bRG/APcyHbfZoosQQ3Fa9SfUbjOxtSjiL4FK+4n9qvab9DKldX624qbVzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyukqCfFH77hIuw1g0EEjYI7Lx3StxkTuR0u5ZFuHF0XJjXUG/l
	qo8VEm1fDIJDndBt3xeBtRjLgMOu3GerGSYpGNVfr0RVMJvrtqWy/K0F71MO8UDPUMZfrCNxPKR
	QTePJtQw2vLutd4D7KM4e8bkpOQypYDm5txvn9gpvbw==
X-Gm-Gg: ATEYQzwLFhVt+qvLcIota1GmkiOGCqNlpgSmvVMnilQ0Y17gWaJMhxad6EN2fZ4dehF
	zdxbeLmpl4HuSyKlsj5hSCgzgZHT+9hQIx0zRaS6SDJjDgHcvTdPfoPHO+EEbOua2zv1bp/Za/5
	U7YqLzwTiHqCaFm07f7m/vIJmaoxq+SDVO7cjIu3hKT5SIqvjPnC735CIWL8D3SroxgmfdH3/OR
	hQR92IWg5Xj57PIa8+pHy9l1OxaSRbVdn3hOwlEbgm/a8jlVHtlqT/E6XdUviYj8R3pmNfbDze/
	/c3bHPjd4Hu665huqGgQWjD0fiPbpULSJEQXSXMCJA==
X-Received: by 2002:a05:6102:2908:b0:5f5:459f:9860 with SMTP id
 ada2fe7eead31-5ffe61b0681mr982266137.28.1772809012534; Fri, 06 Mar 2026
 06:56:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:56:38 +0000
X-Gm-Features: AaiRm53uvHQccafGc4pUCi7QdXkQtBc4s9nxRYsP2kqD6MjlxpYsHiREsE46KEE
Message-ID: <CADrjBPqsQhmL+7tFQQdFDq=xbWKMUcADXiGoWehKXgWe1FVhnQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: power: samsung: add google,gs101-pd
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed and
> because power domain operations involve interfacing with the TrustZone
> protection control on newer Exynos SoCs.
>
> Power domains can also have a power supply linked to them, so add
> optional support for that, too. It is believed that all (existing)
> platforms could benefit from this, hence it's not being limited to
> gs101-pd.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v5:
> - add domain-supply and update commit message
>
> v4:
> - add new vendor property samsung,dtzpc
> - drop previous tags due to that
> ---
>  .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++=
++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Do=
cumentation/devicetree/bindings/power/pd-samsung.yaml
> index 9c2c51133457..3f1a2dc17862 100644
> --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> @@ -13,12 +13,10 @@ description: |+
>    Exynos processors include support for multiple power domains which are=
 used
>    to gate power to one or more peripherals on the processor.
>
> -allOf:
> -  - $ref: power-domain.yaml#
> -
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-pd
>        - samsung,exynos4210-pd
>        - samsung,exynos5433-pd
>
> @@ -33,6 +31,9 @@ properties:
>      deprecated: true
>      maxItems: 1
>
> +  domain-supply:
> +    description: domain regulator supply.
> +
>    label:
>      description:
>        Human readable string with domain name. Will be visible in userspa=
ce
> @@ -44,11 +45,28 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  samsung,dtzpc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Distributed TrustZone Protection Control (DTZPC) node.
> +
>  required:
>    - compatible
>    - "#power-domain-cells"
>    - reg
>
> +allOf:
> +  - $ref: power-domain.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: google,gs101-pd
> +    then:
> +      properties:
> +        samsung,dtzpc: false
> +
>  unevaluatedProperties: false
>
>  examples:
> @@ -66,3 +84,12 @@ examples:
>          #power-domain-cells =3D <0>;
>          label =3D "MFC";
>      };
> +
> +    power-domain@2080 {
> +        compatible =3D "google,gs101-pd";
> +        reg =3D <0x2080 0x80>;
> +        #power-domain-cells =3D <0>;
> +        label =3D "hsi0";
> +        domain-supply =3D <&ldo7m>;
> +        samsung,dtzpc =3D <&dtzpc_hsi0>;
> +    };
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
