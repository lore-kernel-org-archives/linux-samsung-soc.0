Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9197F208A4;
	Mon, 19 Aug 2024 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055601; cv=none; b=I59bJD4atz0Y+Q10b1McYoNGRL4IdPiLPaPho60/MRcqQEaFZg8Mvywky8YHdDMXL1pLFZYrWQbyGFERPAdfvR4rgXTYo8192c75BkETRcgoQJ1DSMSgnFuuJuR9jiXbY7Cb593tjRprFexKnjIqHtW3cuMGddLpXH86KSOaS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055601; c=relaxed/simple;
	bh=Nouv1Dmsj8RfgcNwsiQ+zvpCbcVDYDMltRGUv/xjAqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUkJ4qK76Gunnt0MHDdwxdmDfClbOr4ehPp3nzwREC++UXrjOwSe6QKUh2ATS9mL9dLuMxYo3d0qGLmeVf8sXsKS+WrxhWA48gz1y8euD26UwGijHMx+b0XA1je5RXEq4m0mI3uLhUUpPD0rTTBP5Yruw+liXnqC3yBxvmej6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso33654935e9.1;
        Mon, 19 Aug 2024 01:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724055598; x=1724660398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUYUJLRw3TtbPkMZU63P542FQWJqsbgCa/2jFZaO0fE=;
        b=YtnZRyVCZvwwdOTS6UMacdnJRZdcS1VM3iKYJ3TPJ9ed9WFWoMoe/t4E+689NBxAci
         rsEpcvV0yTH/1X9nVujGKsZVa9sYfj6EfLkMP48sw1wxPQzpJdAuxgOUwkGMy8z6/VMl
         ucH0JnlP6hbe6MumnftEg4K+MRSGpUsCELucBsvxjQ4crOVxfKJzQ4d11AWsLMceGnk3
         fKeXDVYJA0aiigl+xPIwW/ThZM9bsuEYYhGGtEly+CDtJthLxz9BOomgTHNtGR6NKulg
         KnTn0YzVh5Sn/gLjE1dv1vuaHSMXuudFysK12pCUqkaU0CFMKv94PgFGt0iQMHgVtf8G
         kk2g==
X-Forwarded-Encrypted: i=1; AJvYcCUWjafHrBIzTKsI7AuuvswNUC3js6nNOx8csE+jydL7YEPKKBSm/RVxP4ymT7hOqVSqbkvYN8XPP3JRY11tmsCkFbZkNLBs3sl4wzfpr++T+ZTyCxtT3CBvbCpnxB5AckZfPNn+iAPSLnavRB86ZiiD7drfEsyPaytJQBQDyvw6Z7ev/gtQXYRj182QmL7TwtCNrhem1pWH+l3AXOVGOIq9PIgBTdRL
X-Gm-Message-State: AOJu0Yw/MAR3CoKut9uSYaoD/n47dIsplNC1M3t/6hrmQqG5CFklAZ5I
	/hXfojKrTMpT3+ueCKwkYfmcxnnL3fXNoX05GvjLP4kPaUE03wb6
X-Google-Smtp-Source: AGHT+IHFbZ0xIu4V8B12eur1z2oMlUHsadyUlMiAVvi2bhhhOQxH8YyisZyXZiXRYgozYAZBhPnxYA==
X-Received: by 2002:a05:600c:3c99:b0:426:6220:cb57 with SMTP id 5b1f17b1804b1-42aa82651fcmr38918415e9.25.1724055597563;
        Mon, 19 Aug 2024 01:19:57 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded29fcfsm155437865e9.20.2024.08.19.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:19:56 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:19:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Message-ID: <nqokjhodd4g3l7s5ukvhirytv4poiusgd5hgv2ntn3ekyolzyd@zmxxtwjgkqmp>
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
 <CGME20240819052422epcas2p4db394defd5f298658f7841af3649ac6f@epcas2p4.samsung.com>
 <20240819052416.2258976-2-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819052416.2258976-2-sunyeal.hong@samsung.com>

On Mon, Aug 19, 2024 at 02:24:12PM +0900, Sunyeal Hong wrote:
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
 +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: noc
> +            - const: ip
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-peric1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +            - description: CMU_PERIC1 NOC clock (from CMU_TOP)
> +            - description: CMU_PERIC1 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: noc
> +            - const: ip

This is the same peric0, so combine them and clocks could be just:

items:
  - description: External reference clock (38.4 MHz)
  - description: CMU_PERICn NOC clock (from CMU_TOP)
  - description: CMU_PERICn IP clock (from CMU_TOP)

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-misc
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +            - description: CMU_MISC NOC clock (from CMU_MISC)

Similarly:

- description: CMU_MISC/CMU_HSI0 NOC clock (from CMU_MISC)
