Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782354FB6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705680616; cv=none; b=ASFtzjIMK9zRADOO/Ns0LiUwwaFI2l/3U+SV5voSyIN19WYEulc7zPZKivePILOsT60O7V8w7IqW86gu5KQGF4ezfiYb/gH8WylKg+Hv6Khz3JuYSMX1zOVVi4Yk3Lj9CAbZR15spcJbiceilCwZ2SOX0PZq+eBc3sH+tlCevMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705680616; c=relaxed/simple;
	bh=UIfSZZLrOU6yAjs83tQxP628/v7NNSkU0fQmLwQ5Rgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMpw1ocJrXdoMlnsKMhcbYzG3otIxPKnfuJbDkj1lRIFSUpESdVZ8WEwivszfBSeYVitr56Eredew1RQ9OLTaO9n/WuhAUBA4aiOC3/l9JFiT4AM/N5VAGCwI6UB1liZj5DAR7Mm1g79pWeRahyD5Kej8UsWqfIIRGVruQoPFfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0oOBPl1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0oOBPl1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2902264d2edso766554a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705680614; x=1706285414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQCgIpzx27vwofqc1JrDE3mPbm28nF45xDQ2x4EHqYg=;
        b=O0oOBPl1HnzDOBptxY3mHrILPDDqYYsBbHHthZ4fLPO25Hq+aIGGU3QD289YggeXRU
         Qh76VBPuqeEnuq6GMQel73FQcOwcaedTz7PMpd7CU9da+CBF+TU9rXGfOanodGmCidOX
         xjx/FoiJLFWVjn/FeCNyiG5H7i8/8up5L+AA3uRExaCEAmIdF8h+URKlFhMfJ2vB6Dhw
         k00ObGAJaX+D0ph/ljST6hZ9LgP+07+lWGHmi9iveLxlypIzm07uaWbVncvquipFsLMQ
         yvvSDn+IbHjHGIOa4CluxTUolyf8GWaMRmINFBeYE54K2ic5tmq+gvrsW+CUKD7XBqGw
         5QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705680614; x=1706285414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQCgIpzx27vwofqc1JrDE3mPbm28nF45xDQ2x4EHqYg=;
        b=GMEJe9w5m9TMSzfMKGk01sV8pktDHAruYgc5/4gRwbgdMCGVBtRTcYNeWIkxoyAQ50
         adhtkMcJlzeC5nvqI/3CNOuqnuaK0AQl+pirCvXWomeW2AlP07h2x+FtfsUE3+Aydu37
         AA2AxaPea9N3HsHMjoMFus7okMoKl4Du+usz1ry6JPw0J+q9HIhTUke2umfnP2qEz68z
         /rAQ4qPdkIOxy7BMYTa6MfGjdO9VhLmYgRWBd3KR2gh8Lc8LEke29/thanwIvKJgByBW
         TOffRbqCyE2Boluw7IZ+Z082dupjKiLYr9ONhBITyl1QnTBqN14gJyvmUxG52fYBKvIv
         UxVA==
X-Gm-Message-State: AOJu0Yzpi08EK12tWQZ6lOoSpJTc6ejsh/mzHu31r0wfpFk5IoRwau3k
	fa8WUUPs1bzlEQT1/7TLYNN/XzjCFAiaTLTlhPY8MECjH16H97W+B/JUvNXXkMyKCIcyudx6Dki
	5vyvpQg1N6515o8dRdelFjEH94OUPoVWAhFDYuw==
X-Google-Smtp-Source: AGHT+IEiy4VyavSARFTn3SaPOtL6MlCYRRMqM1J8DTeMjjwa3YfuzfgYhlEBz8SnyqE7ELSpye3aSowtoQGWAJ59kBM=
X-Received: by 2002:a17:90b:124f:b0:290:467b:b7d6 with SMTP id
 gx15-20020a17090b124f00b00290467bb7d6mr1054946pjb.84.1705680613997; Fri, 19
 Jan 2024 08:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org> <20240119104526.1221243-3-tudor.ambarus@linaro.org>
In-Reply-To: <20240119104526.1221243-3-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 19 Jan 2024 10:10:02 -0600
Message-ID: <CAPLW+4=GvEZXXzzRj789JmCzLLnQ6cNDLhbF7i6nwiW9x6EGHg@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] dt-bindings: serial: samsung: do not allow
 reg-io-width for gs101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, peter.griffin@linaro.org, 
	willmcvicker@google.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 4:45=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> All gs101 serial ports are restricted to 32-bit register accesses.
> This requirement will be inferred from the compatible. Do not allow
> the reg-io-width property for the google,gs101-uart compatible.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 133259ed3a34..0f0131026911 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -143,6 +143,8 @@ allOf:
>      then:
>        required:
>          - samsung,uart-fifosize
> +      properties:
> +        reg-io-width: false
>
>  unevaluatedProperties: false
>
> --
> 2.43.0.429.g432eaa2c6b-goog
>
