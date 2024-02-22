Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9382C695
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592132; cv=none; b=gqGRrj8f4L5KWNPG1mWFt4ei2IL1RDVdSZPD3+48SrZ31vgqNQThSZNnoIVEpr178XqRAh60jqmJoDlUaMOPknDOgifirUIQKTuxDLc+TcxAlDRjxGIyPW/ZvqfXR3G1VNDIl/KSsDbqZNGU1NUJmrNLLE8uhR44zo0boZJ6w2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592132; c=relaxed/simple;
	bh=5i5jWq9DnIH3DlIu00Vc7MJBkT8ExtWdHY6NMTt9fS8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ui9WFSb4fSVQpaOPm9ZIvVVCKoQdoukksZUJLgGC8P4ihU39hDbUnllrWnr2Q6Kh6MCbnY3LPi5lnJPzjhj3UlespAe/G+siZ3EfDI3HD9vJO0EsYtIB5JEizF+HX/8rm00iEZLim0L7PVklXfS2/0tnhynNl/NCJo72SkPzLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOQ+jNpe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOQ+jNpe"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso8059909a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 00:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592128; x=1709196928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dVwQPfQWz5c5f90/AREdLy2jpdXItaUXCVXismVnZg=;
        b=AOQ+jNpeZSfpOUUKL7S2jN6Nmlwg7lWRPEArHdljLFebbSybMlpIsuLTo/g2TP6L4D
         3xQ4Rj63Tkx/YxuwIhfe/1B7b3+aHCMMUNI/NZ2u/7HXKNSPlinbXPxkADUZ4qMpiECw
         PugvCAwAHpLgo09KAWUnoWFebX/gzsR/zIY8BRWYiXiXP7dmOrqpjwCojzt8N0+ixE0i
         Zp7daGtoiAekhmnJAMO0aQ8IDqnW0RohXaQJLo7nlf68AbU/XVH+Vxr2YNd7j6TTRaCo
         d2RwHRUWm9raqUrccYE0CPSqRRc6bobjti5hOMRFizK3TsHnRvsGhJD3TkM65anIxCsb
         TaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592128; x=1709196928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dVwQPfQWz5c5f90/AREdLy2jpdXItaUXCVXismVnZg=;
        b=Kh0OnZfvesODU7ldjo9LQi9iEFuSs8ZKV6tZK4T29be7Hu7ijTlPxZ2Ne52vaSudBN
         SfmbHRc3oxrDCMH6q/giuizFnI1Ubs/gdpSC5/QE0luzOgn5cLS7H3kHGVjQrWMoO1H8
         ahWT61dLV/4to5Bea7l7V8yTDajsYFAvGokl+jqxpCZu9nnrXuQAu732HNcZKEkSMkhQ
         yKNBZwA/4pxt7uUBWQR4heuCvsqMx1FdD6t1/xBX+JWHQrj56sh/Q7jP5NzQFecq4jiS
         f8FliphQ6JExWdcelPoEdv5rBB1n+Db5jO7QQsl7TbLYPDs7GWygrHemmSI7PV9qL7Vj
         r9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE9R+F5XypiC51mTZFm741TRHiAGXzDXqGiwk2r9EfDX/mgVlySAV0cm4hVVpRxzFY1ZBKt/6xhbbIcUm7DwwopAi5I6+FrDFJwebU9bC2zW0=
X-Gm-Message-State: AOJu0Yzs1Tojp/zlJj3H2H8Xkw6Bv0BJfPqqIUZKaGM6/o6pBzu0QoFl
	CWxQ07cC3kBpV7WHoXpFWdazuf/zXTjwzPyZNsKpMe6STs0y9DU4c1XV/oJ9SOU=
X-Google-Smtp-Source: AGHT+IGL+YtqEIUR4QxIfx4HWjVOJQw8MXI0vRI83fodpBAUEiUtIV1FNqp9YQeKt4pNfoY9Jn3zpw==
X-Received: by 2002:a17:906:c293:b0:a3e:ff36:c83 with SMTP id r19-20020a170906c29300b00a3eff360c83mr6234774ejz.29.1708592128486;
        Thu, 22 Feb 2024 00:55:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id tl19-20020a170907c31300b00a3e5bd2482csm4623503ejc.46.2024.02.22.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:55:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240219125453.103692-1-krzysztof.kozlowski@linaro.org>
References: <20240219125453.103692-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: samsung: gs101: match patches touching
 Google Tensor SoC
Message-Id: <170859212673.12469.13497019748127862340.b4-ty@linaro.org>
Date: Thu, 22 Feb 2024 09:55:26 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 19 Feb 2024 13:54:53 +0100, Krzysztof Kozlowski wrote:
> Maintainers of Google Tensor SoC should be aware of all driver patches
> having that name.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: samsung: gs101: match patches touching Google Tensor SoC
      https://git.kernel.org/krzk/linux/c/9690b9de81d1ad40a70b3d34b9d7e26486a5e83a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

