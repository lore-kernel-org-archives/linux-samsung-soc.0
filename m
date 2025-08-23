Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034820297E;
	Sat, 23 Aug 2025 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755970054; cv=none; b=GyJx69zJcvg7Ry2o+qYgss0kTdG7E0VSzgXC1eTriYuRbzx3V3adD6vuZYBlCpSZgGZQlAaU9Z5cvfwrH+rIXj2LYppZcqZ+uNoTHQu65O9wY8qEECheQFJv1TcjJaYjFxS8C6SlvL10vvLnm2ioUZ9Ba7/3vbvLRNMx0uyxHxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755970054; c=relaxed/simple;
	bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPPURCZs3Vj/Eivgm/4NLGEHuNjAnXE/hNNyIkrlg2NNigD92O79kEsI/l7FtpC17N031RPBv1NdNmlYoBWmbSnNDUW7QeJWcFeqXM8D0jJTQ6RB74pJhpnl9S4EuUNA0oBoVwC3owJMtOrDjhluH6BwQafc31AgGk9PPrGphho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6La9Yqb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6La9Yqb"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e87067b15aso361729785a.3;
        Sat, 23 Aug 2025 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755970052; x=1756574852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=;
        b=l6La9Yqbn/3zg1t4P6uwZ/JPMvkRT0hBEd349+8zuqtqEPf5DbY1tkChJHrzL5n4fJ
         wWri+9bzpVngL588kHuByXMt3SHin8ZF8eBlQ8E64n27zEDeROH19wb0+I03qYXqzjrX
         kxtgki627QSihwg5Jq1hirAoZ2XcUCD0gfYX17z66auVYI7UkqcAcPkp19vGmcaPA+cm
         EI3w67oS/3KsX/856Nx3bC1TKJyWFe+qUhzxZnaQckc4e7Xfw4YI2u9HK1+O1o+xUVpb
         Zqho/YppE/z0aRUWifFuilnuova0lku8bzL3Yc+rep1f7D0tXzCnGAbbHjRNSKkRzajq
         cSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755970052; x=1756574852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=;
        b=F76A8/YGwjcMs2TWM8usc1MvUjFBQ5j657SxBFIKY/a6uR9HG87SE56IBKO/h2d6Wm
         s7PL0DcL9vUJtsWsNJaLuit9CJTtEe7EYqhagaZiAjDY1aofAEg76Nr7Ke6LJgfILAkf
         v8t93VhD2gNumSmuWCu8YgZ8siXM3ZNpaIcuT4Dl23lM3gWpoNVRU4MnRoZWKidbhiMg
         cixeMATJLEqbzSXGSZJDZFTG4yPoB+KhiyggjXuwq+HibDvFZT7EWHGh49Ng9h2YbWX4
         8Lp69ReVatjBYZLqm5fC9vXCabCIuforaYWRVwuPFQZZ4hl/KV8PzBz0GPijBY7gpGtG
         dVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlJpjipvx0d809/G5llpTGZPV0YJ1fD0MKmi8F1231qTP4hKRWSV9WZcZCXTkCD0dBpdFpcrCEalBqUuZW@vger.kernel.org, AJvYcCVfz/ymMKrq+l852byTXRAOrmSkwE+YHJi43bDD6T5ibd6u8NPuZ6tWXBiIFFSubj20mC+fH69uO6tB@vger.kernel.org, AJvYcCWXNoRswR2lAoHiuZHGKqWN6ZtYaCh+CImgpudePzg5utPbSpofvvnkmqiTEPRs3UrUnSR8BfYzgWf7@vger.kernel.org, AJvYcCXmLe1nGtWg53LriOlsTBT4z/pZfYSdCAJPbVX1clBCdd5lRalYgcQn41DOusoXKroPhtdtfqcEn16hY4uQ84wwjtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tiPmYzMg3O2jg2X/LLEYTtU2FkrhDz2dN5u9pVgvwFmleVVG
	jyuDgGqdcRMhJvhGpDuSJMU8ZUxEjUCnVBUtH52q1nCCpIG+O/DAXA/jyzrKJvP1WUc=
X-Gm-Gg: ASbGncuOl4pM/a9P4gsQXXaL+nbOS2/5sBNDKAVUtVcoUvZy3E1AJlgHhIHJjMBvyPs
	n20xfPcdwME0rmFRDH3Dl5I1tBDRnDJjgomxUjLZ1UzX7Z61c0AKsgtApOx1sSia0MI+v55i/wZ
	cgipzCeUM8i4HIwlvqFfeEBQdwzfJ4rfIQSz6hYKXetGsXqKKt3L1cKX6pigAvLBZeNjIuQLLAW
	9aV4o8n+UhgLiK0Q9BCiZXg9Br4JmoGZe8LcvbMP5st1SS2MPeyMeLqW3HY6m3BEYdAeYjaltci
	cEcHeMdR273J14XAWujsrXay8R7gQ/bFPV260NeglubHrzhlA6zeun/U0biNiPvtXkHFuSpMbYq
	pUdLVyBcxGLFgb8+g/l0eY6nQCoCI2QUdQw==
X-Google-Smtp-Source: AGHT+IHsakSgynYXDTEIxfql1qjzpysL0gClsR895vhO///5Zbblp31VQLCpZlK+UWogbB1c6SvypQ==
X-Received: by 2002:a05:620a:3189:b0:7e9:f820:2b8f with SMTP id af79cd13be357-7ea110b94b7mr813978585a.80.1755970051597;
        Sat, 23 Aug 2025 10:27:31 -0700 (PDT)
Received: from codespaces-a28d22 ([20.42.11.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebede53d5esm176063185a.24.2025.08.23.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 10:27:31 -0700 (PDT)
Date: Sat, 23 Aug 2025 17:27:29 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks
 and extend
Message-ID: <aKn6AYIAG9eUeSx2@codespaces-a28d22>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
 <20250820-2-v2-2-bd45e196d4c4@gmail.com>
 <20250820-diffused-impaired-ba776d39692f@spud>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820-diffused-impaired-ba776d39692f@spud>

> This looks like a massive ABI break, where is the justification for
> doing it?
>
> Cheers,
> Conor.

Hi Conor,

I reordered because the current IDs don’t match CMU_TOP:
the PLL mux select is in PLL_CON0, not CON3, which gave wrong/low rates.
I also added DPU/CMUREF and a missing fixed-factor path to stop bad rates
and clk_summary hangs on hardware.
I’d rather fix the mapping now than keep a wrong layout.

Thanks,
Denzeel
