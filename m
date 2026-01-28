Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21D34106D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639676; cv=none; b=gX2wABP3sjn0lKXMyUgmcXJeUvurlLy6BGh0AP/vsFqxlsWphdbxoHy9qDWuIqI3kCbTg8Ra9tse0YBAKI8ZTzfH0eIcmfv5Ed+10y3kDYAS7fKLMaqHsawkUX6Jbg1mTMOmGXSo0E5A4etfz6GMBZl9hBo2GKgtLoWz8KCgp88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639676; c=relaxed/simple;
	bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F52wGuJfjrNoeO3QBp4RjT45EdK9JoKQEMtJxy30P3jVas96okdkpm9NyEBYT4PYumyoY8HjkVTP8EzfvhrQw5aMEEIKi95huXu5iG2uuHg48sRej086c8gvUIjfZ+PQtxly9bFwb630IBikeV6cZjDOBMNPbNzrNyuRl+9WwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9naq3UO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9naq3UO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so312933f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 14:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769639673; x=1770244473; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=;
        b=r9naq3UOKrKXa6qySYkwnk7Mm4vPW8RexFcy/Ej148Qua446jUKMSrE2A7A7UmCoA1
         ufqeiF5MvqCij1z40Ji4KrEuZjZRVdOp+YkU8xMQTRVgULL1KWxUDkh9XHrdcZ5xbdLY
         rx9HRVF3iY9eBxtUhHqWn//e4HRUlqZl2AtIWCxJW1uFtnfodORFTpDorN/HKxqk5HhA
         yrjFTvHkD2lm+SskblVDURqEgIrL+JaPti/Zpiikn5do4rLtAWAjkqA12sSTbl3zEQ7U
         4nWgBORyc52hkVhRFMfMV1gVFAmtQW4L5dSV9Q4Hbkz52+4UqmeWudpbTtAUEWA7eLCf
         g1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639673; x=1770244473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=;
        b=Soc7Y4R9kfXxkbAu4+E5A56XD+OxmQDTmHzj3NMq5HuoIyp9OnfL3s7j3LsKVI78sz
         pR+/f2XILRQaSGG1i0PGsI7eFxonJlOMASMD+YukxjgUbaUwhAFsQ+MGmGp383ZmPCUN
         sHizlfVlpXWp9LxpmCD+ZGlLcy0y8QXyy2g/zRK9quOJP8ztY+u4qycKKAMVykcWKLu5
         0tFpqvZdiU1mwI4UJR0PEgcGwwOYR508Z8LPz4s2GgL6uGYsTv5muwe18KiClLsC77zO
         Yi51KMxP/krKpFNIv18FnMLVR88dh2NPKTN9w+D4oveBAs5WIsZhtP6uRmqHyKwUV1tv
         O4hw==
X-Forwarded-Encrypted: i=1; AJvYcCUhRCj6Ybfv/dKr71V1JWQS1vyYuBvN41GpkEQiHKpHEXJZRRqOYXFp0kDTFFH+l0X2rWouDbeQWgvpKzUrr8xdGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrf4Etoc/xis6X4JPgtF3Gt1gquq60TarE7w7+DiubTq7rUis
	7kCsjStxKzrzX0gO+0HDSlZjjrbzo5NuZ2UOIpcO/or0x6+UlhS7Xw+xi8fKvQ54EmQ=
X-Gm-Gg: AZuq6aKyyLlt1kn/9OFOmSd8jwA6o5URBkHYh/RAI19W4JEyqcAruikv8PBZaFPuJFg
	T57qBBee2pjifn08PAmTl+E6A+KSktHnXpuHyCPpjd7M0CbzMnznw60doLiF/Oc+X2tObUHY1EU
	6OvKGIibMNXQzIIisWseWANVD2ttOaHzeuWOU0e/jeMglXon2XiFchwNATVCkDGbJrpZvq5b6Zt
	WvtVqNjWeBc3WicDxY/fcJPhqE1i+yJ4wyTLXBl5q/BF0vS/zp6ygANmKLGLtEkdANTgyFi9CAg
	TqxWlmywF3hqxCEdPHwLGCYBZeKl6qYJYw11bDzJ4Oh+w33nKOceWPP9xEKNBcA6CIt6aetwr0V
	1dElb3GTSSGPastqt9F8okvt0Tr3KR0QISyFIaL+O1IztwbY1gpn4pdrM3x7sSKY1y8MW27mzB9
	ZqbWOlepQhfq6fSeWHhxwFg6bdnfge58o0pw==
X-Received: by 2002:a05:6000:186e:b0:430:f40f:61ba with SMTP id ffacd0b85a97d-435dd1c0df0mr10119608f8f.41.1769639673349;
        Wed, 28 Jan 2026 14:34:33 -0800 (PST)
Received: from [192.168.235.30] ([212.129.85.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm9819343f8f.21.2026.01.28.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:34:33 -0800 (PST)
Message-ID: <9936b5bd5f1e19f65c199d36ce54bb0af0e44b85.camel@linaro.org>
Subject: Re: [PATCH next v2] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joy
 Chakraborty <joychakr@google.com>, Naveen Kumar	 <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot
	 <lkp@intel.com>
Date: Wed, 28 Jan 2026 22:34:31 +0000
In-Reply-To: <20260128-next-v2-1-624bdae8e6d0@google.com>
References: <20260128-next-v2-1-624bdae8e6d0@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-28 at 21:22 +0000, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
> is configured as built-in.
>=20
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking, and 'COMPILE_TEST'
> to expand test coverage.
>=20
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@i=
ntel.com/
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> Changes in v2:
> - Add '(TYPEC=3Dn && COMPILE_TEST)' to build dependency to expand test
> =C2=A0 coverage as suggested by Andr=C3=A9 Draszik <andre.draszik@linaro.=
org>
> - Keep Peter's Reviewed-by tag because the change suggested by Andr=C3=A9
> =C2=A0 is a trivial improvement.
> - Link to v1: https://lore.kernel.org/r/20260121-next-v1-1-c18068b091b9@g=
oogle.com
> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
