Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D07371D10
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780366; cv=none; b=coSvnHtNk122ecMjhK4kpcpf2if4Axzu0zEGQZAKnRrodYKQ39lMO9hxoZJthf1XUfy1dFqThSy8dTHUy3Ok8SQQXeCzp7dEqIBHOtLmkw10XbMEQQeRFu9Z6tpvDO9Eju7PiLMEwNfe4/zkAsLojKUH0jG8lMKqyvNPmStDmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780366; c=relaxed/simple;
	bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0pU67bfGulyqcfO8N4DuaAjsQoqmcuJaHP+1raboLG4sH8ThvpHStuJQ9eFH2KvPE5KZdy1t9VvC1nWRw9FFqazpNPDqo4c61R8SDIF6uPwSITOlO+8kSxL2sT2DKzNH7pyKJiapYaVVgQiyygS3Sgp32lK0E8py0CaRek6D8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUP2PwYE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUP2PwYE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5536047f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 22:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780364; x=1773385164; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=;
        b=sUP2PwYEm4Ugy/4/P9CvSY3k9J1msgHnFtT9fftQbsls/rTV9lBIu2WL+/nEZsvUSk
         j9DsMxYwVIjPe5XNsRiZe9ntR1XbDdbOUPrqbIMPCUgobxcnvVT3lTmlsKdzsSCk3b6J
         eDn0EjDqYm0D+vu9tPoq9NLD7CSQLSmpnj34ND7oS+XiUfBbL1ZnE8DFZwR6Swgz7hk3
         cI0bZC+eU3K8KIGgjtAJugPvnwUCu2Hc3o5F7pCxwChVPHdTaxopj/UQ1mb+roYkPwTs
         Zfvy+SvETGsniA9rwQ+Az7TwfqOfyz+RralV3YSwjJQOUDmBwhwYTRpZK0FkOPBvD/Vd
         9m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780364; x=1773385164;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=;
        b=BqViGDzJ97Pc4x/rp3tlTz5v7J9s/qY2uRdgqTZqjAUbD87xf6yoHmxaF2DooZqPfw
         d/xYfbRXEBwQb9GZCqLMhmPzqByzvQgucoiz0x0nR8VvapIZ2lC48hgSYy7UnDZwVT+y
         RuM5N/mjbjIBAXti5YPGtjMCkGbaelnMXQEih8f+dWB+/00m4PMbCmIrK4nHFDMan/lc
         iYLyT+yyBVmsJ1X83AF0+TCDEBSdVC0twAxkcGFIlFAjEC/ljLv1rXgrjlPvyCV62ld8
         /Z9vRngzZs1Ev3CxZFgN8lrZLIFE7PuKPhoB5iH12dtckwE/N7kNP5TA0545rdUv3NS4
         MYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUZPH7zsXZpxM1watIs5TufiBRVbIxzCCY2JL2UspIl5I7MZTC26Wk2RQyDh6JZqOQSovn355n+Tr74/+FBUwKXKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oJZHK7DH9QQlA9UE9f8HAm7kZf9GuHaj5bfNvXUPb3ZXLwX1
	syrQIFsa1WX9Ag8d3AXvvTf1n0njw5L3lUNl86uw7lzGKbsG4hbBmp5UCOP2uaVdpk0=
X-Gm-Gg: ATEYQzxbENXE8VoGikplXMnKEZzDvBvwSr56FmopziDyK7+b4+sJMW5i+CBNE20pPm3
	HFjXSOkMdQ17jIdlcyXCHmpktvRKdnNTZY+CQdY51xlgp45CxiAlqYLQaM6HwbNT5PwCaljmKjr
	FXaEb9iVvr1EHAolyfmimn/TpbJQdhCXE/2jhAvzruzMBkaWIt2UHb2xPACX7DQA0l2CVnTk5ik
	Vn086k4efnzE28JIaDS9bFzpHpXy5t1yiglVD16nwXsytXF81zz6JbjLVNd+Bj19rNI9pdoPEqu
	J4F6HU1zvQ4SLGoUCbDLcmbvO5/qLo88H9+Hj1SHFqAzNoenWMk00autd5o50EXXy8+CidJAo7L
	77CO9ZpjJkNNltAM6nqpdbes6xoct3YDhxGECkowgP5CwH+d88/4Oro6CxOEnV+FIAlGI0ZAZRD
	5L4/BDdW9nPDRTZ7oBm+SfP1/9BmTFvVaSFU7wh2A=
X-Received: by 2002:a05:6000:4009:b0:439:c8a3:45f3 with SMTP id ffacd0b85a97d-439da555695mr1568221f8f.6.1772780363666;
        Thu, 05 Mar 2026 22:59:23 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1701166f8f.24.2026.03.05.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:59:23 -0800 (PST)
Message-ID: <c323298f8a16d62aae47fdbd24d28d3d3c302d46.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>,
 	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Mar 2026 07:00:45 +0000
In-Reply-To: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
References: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-02 at 12:35 +0000, Andr=C3=A9 Draszik wrote:
> For DT validation purposes, this patch depends on the binding updates
> from https://lore.kernel.org/r/20260226-max77759-fg-v1-0-ff0a08a70a9f@lin=
aro.org
> They have been ACKed, but not merged yet.

Just FYI, that series (including binding updates) has been merged and is av=
ailable
in linux-next.

Cheers,
Andre'
