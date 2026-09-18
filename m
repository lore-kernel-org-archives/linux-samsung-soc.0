Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF5342523
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719940; cv=none; b=MkJop1cYpPXD9mL20myanvkKReNnz1d4BRoQtbab8Cqlw1sic+2B2e22SacQ3zrBkGLHXU+TPtOqAhWf21+UDUe96t2Dd3CMQMnTmbhUbSLlX5EXrxXV60ToQ1xfGQ9KNYkQzKKKUd9JFiXDvlplxTdB2oG5ScXkJ1IL17KlsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719940; c=relaxed/simple;
	bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YiHHGal78ET9IXNDNQUf1OqUYAODnnKem2xl/kyQVkwDlAM//LsVDKyPrAF9YIb1xG9fOmhraI1+Nmlxt7tPpo4eBVyYgZ6Xp9ftPq3znHcjPkWNmxcNOPhPhchSUzozFo4sjh0+77OJ5W5H1CF2q1gQi9KkEWmlgffMNZXY5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMRx/cPM; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMRx/cPM"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so85870766b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789719936; x=1790324736; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=gMRx/cPMWcl1E+8YCuBm61yN3C7YYrWH768CxqTtnwm65LOk6az/NYCaQ2HOGgXCo1
         gOdwHdLqQvEQAGZqtevlKAUyXK5Nh/o+Zwt7a1le7A1H3HwIzlRUjO47vtu2nE0s77vk
         RXNE0WfhYFFJNSODGyFsF9Scq8rk+gzVdvxQPebw03Yj9gch6hI0HY4HKz8mcvdX6yc2
         Lq7EK0SEhOq+9OmdCXsydTp5wjlP1XFX43mIZM9s05AI53UEos9FbTa3K52m6PI+MlAc
         7wrKsW5lj9ybIcf3vXwvT4YvFfjKXfc2osDz82URcUj/CXJeD1aQ9wf55Su9e/YChLHy
         v12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719936; x=1790324736;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=sqKpLQ2SRhXgk8osmAVhhECITrq6huDBris8M75K7g+DE9Unj3dzj4QHEk8mSNfQOV
         6WgU4k6IqfD9RBPUl1yyR2JxiUq4aLzYJ4QvYedz8g22Z1T8aGnH9cQaqpLH863BdPmA
         yGpnawRjUpWroN/FOGznyL+rFxrKxA9ebkbGtcR3f3/P9TzJ0fsSZBbQUfFt6JyHJXez
         4ELpGYJUF9oOL/ilqBy73Lya65UtS7VKEzTeHnyXRy42nMIdmFs7PU7HXs+jT6urte3l
         8Z0sFYegXaEtgmu/hiDBbmVOxZ8NGG7LI4nP/HrPPD78Ga4MFctaWqrh/dwaNVnWkBZL
         iilw==
X-Forwarded-Encrypted: i=1; AKwUvBzcyu4+2kNok3vmQr6/rAHAf0SXuq8UZt/2ebjojNyWuNVUaS0uztcatqxAiwCQ6cT4DHYSSHA9F+62vuVDTqKMpg==@vger.kernel.org
X-Gm-Message-State: AFuF++kh6YlWCT4gL4bVDqCWdobYAmCpqCtviXjrR1sT4gEiGOlQNsXP
	W7WDvUkyKMDT8UJeL256k7wGKN1hHEHtPY6mC5j3OBAGBTOYI+usVEeMvcYUiJyO8R4=
X-Gm-Gg: AYBFou0VG0lRwHdhNxpnAaFKPWA837NsUq5o5H4fWagQxVzRWBlVKdcoZpGtLb9P5Ps
	8s7PpM9tPUyAQPBoh4qN+iYdNv0UbS6Ge4EooUxhpXlflKDkcXOmPhuPO1UnD7+rAbyQvag53c6
	eeML2rMqvHXf8qyRELenLxhEIPFh0sOTd6WXM6Ch+6GTvJInBI/0X4WB6tYZrFdpj+DuBiuwzH4
	21bxlgBtPLbAlPSEyExz8DmSYopJD0YL6KpRs8P5YhVbq3IUjvpy4ZyzLdJTInxZq6DbWgiOwHz
	W+SxnDNkPQOzvk+rboeRMK/YAie75QzmEo2xxRgcNVf5/dK6u32+ZorvOOl3aQdTAtLGKZWS/UL
	PxQhmYX3vfucb8wfo2xKbeLI/NNaO+oSH9pRxVNBCrU7VzARUoj5X0OlEzr2y9LcmXXjEwxDYot
	/bGcWIeZsqJlZZGVSiTZwtCWEj3Acgcto2gVHoPIbwhWmnHOXiED5me3xlu/G4S9gQfWTegRXfv
	to=
X-Received: by 2002:a17:907:c318:b0:c29:5326:5a63 with SMTP id a640c23a62f3a-c2a159adca8mr151942066b.16.1789719936083;
        Fri, 18 Sep 2026 01:25:36 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm31148966b.20.2026.09.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:25:35 -0700 (PDT)
Message-ID: <45086d36bd16a3475f43be03f34b9d712ec8bff9.camel@linaro.org>
Subject: Re: [PATCH v5] mfd: Fix typos in comments
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>, Lee Jones <lee@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Botsz HUANG
 <huang.botsz@gmail.com>,  Nick Huang <sef1548@gmail.com>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Date: Fri, 18 Sep 2026 09:26:59 +0100
In-Reply-To: <20260917054045.15805-1-hemanth.selam@gmail.com>
References: <20260917054045.15805-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-17 at 11:10 +0530, Hemanth Selam wrote:
> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Only touches comments, no code changes.
>=20
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
