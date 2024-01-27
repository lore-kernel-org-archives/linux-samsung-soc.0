Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A4E8F7D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 01:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706319448; cv=none; b=QgXRKNB2nJxDM0FjKX2OaF4ZAYEoNDydFnQKKbHlzDuVmIRXY+WR5jJOx1WALT7nt2RzwoJ9/dQgpxIwHNP5X0zoIx+x0Sf9BEL3+kUixlnctuBnelT0Bf9KQXMsW8nz3Su9LPkHFtQzQJzzBlHJE6CSKMvwhxSxsLq4AVoT64g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706319448; c=relaxed/simple;
	bh=DYj8tn+3Am911Ik0jx3jOUWXXFDXDOrUv1cfVZEFjMY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SKWFho4Oc6iqY4pnOA9W/obPyT9gam1rdyzxTCqWwV39t6Scl5Zyw3jvk4rrLz6VagaEwIh+OCGuLnSBWhpS7DveD+oRcS1XtkSh8JxDAlmc7F1XaYSm+RdZgE8iun6sw7WoK7qNTPtpXDBGcfXTQ8kJMN1UQ1BBvF0HQGiF0ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCkJjqS0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCkJjqS0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3392b045e0aso1223488f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706319445; x=1706924245; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zeFz+NtLoAQ99uBFeabvQ2L4PFgMX2DpcEuv5deUslc=;
        b=dCkJjqS0NUJGE1e+H2OGV08Z6njmaesCwefjhnF3aZFh+4MPGtK8Mf/64RqHZFx80z
         iyw71WAHZQDFTDAzZGxlooQikMbWQym6AdX9pWzu/mvo6vfpifL5FsKTZ0wdRBzGf0O+
         SRPnh3+HCDS2lq1uREIxLP21ScEN4ncg8P/w0+eoN1xUR5ym0Y2/mqgOlhyhpt1DO/qY
         YPdE3HcrGioqvHfIqDZvJ/U5UIfSvJCTmA3AcI5+73uc4BArb54YstPB/R/dEhHioqHJ
         CgnoGnxSisFnR4h42CUWhM4GdWpBUeWFIPk4eXhRhwx+ISjHiwg879eTmRw/MhWL94CE
         NFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706319445; x=1706924245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeFz+NtLoAQ99uBFeabvQ2L4PFgMX2DpcEuv5deUslc=;
        b=mYRIKPa4NQiVEd69SFx7kzd7m01z3xszRCKyPXDmHJh63lc751UubVSqKFhD8E0ZJb
         Xd+Incb5hJwQSz1QnGd3Y/1MIw65clLbOp61fZWiIywtZ/1LNH5yA5kAWuadQ1ekauDq
         zxTbMhwKQrEGvI0SF3wRIAgICJxIUzz9EuJrrZNhzZAtjuWJxqGEfE3NAbkBsxlH8kSx
         rLIAHr+Pg8VRW20AZ1mw4/OHmRQtO2apU1uWiS6omMI6lFRNQ4rXt93LzbLUZ4ViB4wj
         IaHKzQ10TnCEnzVkAdwsnlduVU1GZckTW4p6PI1t5OzSOy/00u2Tth8Lsu7p+KvnqWVv
         bZ9A==
X-Gm-Message-State: AOJu0Yy4qE1We80347zpeu8cqy7dmDShPYKw6/qjNkOTkdS2msMNEGO/
	uvLYRDaCYggtlHc0KVZ304hRWp2in1Vd55Tm95oZZdi3luUL9Egp4z+9stfbneA=
X-Google-Smtp-Source: AGHT+IG7o3FTd1/T/dXyz8w5kUpeTwkLM76RKnG6DH3eIKmaAhEFR0fu3enxkI/xjOD4tjrr2K/sfA==
X-Received: by 2002:a5d:54c2:0:b0:339:357b:f61a with SMTP id x2-20020a5d54c2000000b00339357bf61amr325905wrv.32.1706319445215;
        Fri, 26 Jan 2024 17:37:25 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id fa7-20020a056000258700b00337cef427f8sm2377408wrb.70.2024.01.26.17.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 17:37:24 -0800 (PST)
Message-ID: <67b2686739e64bad4fb4f84cec0d0f222831a2cb.camel@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: exynos: gs101: use correct clocks for
 usi_uart
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com,  cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date: Sat, 27 Jan 2024 01:37:23 +0000
In-Reply-To: <20240127003607.501086-5-andre.draszik@linaro.org>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
	 <20240127003607.501086-5-andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-01-27 at 00:35 +0000, Andr=C3=A9 Draszik wrote:
> Wrong pclk clocks have been used in this usi8 instance here. For USI
                                           ^^^^
This should read 'uart', I'll send a v2 after collecting any other potentia=
l
feedback.

Cheers,
Andre'

