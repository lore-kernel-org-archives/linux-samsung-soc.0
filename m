Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BB33FE30
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716255; cv=none; b=uTykGqIIfxGJHb2hZVv16M4ADj6b13N8hkPK+ncfFbZkbDKxGp4xyxUylRDgaK9qSxGsHrxZjrsK5w2YiMiqBavFlsEKe5wJAq/aMN0bm5Bdpwx6T8wv0R/knuzNRiQ62aZvxzgp0EmfUU6O6eweUs7soha1KR/j99rwAb5X8JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716255; c=relaxed/simple;
	bh=1pBCYnHFsgic841R37PpD+tVqAXLXnxjHHtGtlF68x0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HbOE6XFFmJ8FQ88nktP1cZb0R66UTJfRfs/6V4qkv2QoXKIDWEMiE3AmnbnHFyQRH7l9rIxRfBc2muzDefmHWb5FCDdjcP7if2EUZKKts0gQr3ADqHYhVWVZg/DFpC48nRq71VBYsK6jVifjT/3RZ9fQIKobwtzB0T3Qw/ZUn9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJC9lWKu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJC9lWKu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so13255945e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 01:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770716252; x=1771321052; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1pBCYnHFsgic841R37PpD+tVqAXLXnxjHHtGtlF68x0=;
        b=HJC9lWKuwufyEOyXeojsEu7DUvK3XfzX733Do+b8W59uE6tPLVMoNNdsZu/stjza81
         rwzIOpA/a1HC7giEUKjXEvS8j4QdoGW31l+/5r/IEe1ExBi+kKcrlaPBS1MVrRp8k1PR
         LhmWIm+zhlmp1EQwhHcLFwolMt3eA4GpU/uPPxDzJtgevawsahmKEUdHpMnxwqI5eotw
         EFa3HbE3B0Ij84z92nEYif3Dw+peJuucOywU04qgfFdMGXBttnNU6PsEfjdPnnwpqqzI
         5x03SAiS37tZPTGC0M24QQF+Le+7QUXBi8skMCWi2begBhxdPCc2jrG3JorA8CEkeYaP
         Xbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716252; x=1771321052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pBCYnHFsgic841R37PpD+tVqAXLXnxjHHtGtlF68x0=;
        b=C0I/r0W5erZShBuNk3hH4Nxicw1M7/fRNbsNQbw0nD0OfUxfneVXnp1jRrSVhBQGrI
         trFqtbDqMmaDtx6FjNJsP8YrCUxA7MVcLMCKniGI8E25qVpGQGAAlTO6I4lWh9Q2f54j
         d8A9rZF8RD+dZ4U8Iakf0GgBs5sod0vI+2Q/gjCkZKWxgonSRTENvB5YRXRX+DFdCxZR
         2knT5PTIt7Sc+RGH5gCrSVVblbcTyissS5Fljj2YrNfN8GRkpB4WDV+A910QDHP9a7A7
         r+XwXjGma9UfkuOwTFV7d2VJnxUDBtKQ1XgJu8bMaos14NI01SAGca22V6MMBEdbhtik
         rfig==
X-Forwarded-Encrypted: i=1; AJvYcCXHQHiPEhbXwnv5Ekh/rUtXD2sElX27mfz1XMs12Sa8YqsNx3fRx/A5EyPaqp/E5Ij+6waStsE2sZBXOo7mx+S6yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztrXSv8bk5zdkEizyRrZwttRnn4C1691Issqkno6nRmv+gcrbo
	ENbi7LHYjJVMybfAaqcCslPA6yl4LFlP+8czMa7nYycn6vO51LBMEIIlgVUNbCNdQdR6DbrDckR
	0wcY/fLE=
X-Gm-Gg: AZuq6aLdxTU+Ul4mKwScjysZ3HhSkf3fNINcNA00xX4rSLuv8SuNoCtnrGCJzmt5cvT
	SeCi01jAkAdr4mAgK0fySUCJrkr+X3i6KFNMDUjsdNG3+uZAPkTkep+2vjVKmK7zdDU8MUYcK36
	MpxJxlxykovNhV7uOUD9VJlD179asOeMrkWCc3Z3cIQf4bDBJG01UwgWTYHrD8tj5TuSkYidYQP
	C+mMd9DDjuE05h62h3zw1Nogo3ytEDeG5fqK4usAFZxvvYZ02gn/nrPFUl+J4aI92qXH0Ljxy20
	a7/VQduQnae2rR6yFrnqKF6uLlbweVJG7ZCNRTSI6a2OiPueOI36p1yyOkGfD2j17YA0zW9h2S+
	ThUyTOMYM6E8P5mvAAqhTteYbjpNwwHN6N9kgEdh4X+am+gLNjKZmUG8+yG9miCnennLNGgXRxO
	ipcPJAsWmjWoebwT8tRAU9dtHrz6ZTHg==
X-Received: by 2002:a05:600c:6592:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483209c6dd4mr218940985e9.34.1770716252254;
        Tue, 10 Feb 2026 01:37:32 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e64b0sm57319715e9.11.2026.02.10.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:37:31 -0800 (PST)
Message-ID: <0ee40d36397bfd4c04aea6ead07e42848203e9d6.camel@linaro.org>
Subject: Re: [PATCH 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan
 Carpenter <dan.carpenter@linaro.org>
Date: Tue, 10 Feb 2026 09:37:59 +0000
In-Reply-To: <1e8ee0ae-a74d-418a-80b1-4d2379614548@kernel.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
	 <20260209-s2mpg1x-regulators-fixes-v1-1-ead348e64e14@linaro.org>
	 <170a820d-b987-4fd7-acca-ac88bab9e243@kernel.org>
	 <4f1b1d857c0ee17436cd61e97219f508bd89f917.camel@linaro.org>
	 <1e8ee0ae-a74d-418a-80b1-4d2379614548@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tue, 2026-02-10 at 08:28 +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 06:59, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Mon, 2026-02-09 at 17:09 +0100, Krzysztof Kozlowski wrote:
> > > On 09/02/2026 16:07, Andr=C3=A9 Draszik wrote:
> > > > The sanity checks being removed in this commit are useless as earli=
er
> > > > code checks for out-of-bounds conditions already. They also are
> > > > incorrect (as they're off-by-one).
> > > >=20
> > > > Simply remove this incorrect code.
> > > >=20
> > > > No functional change.
> > >=20
> > > If they are incorrect then how it could be "no functional change"? To=
 me
> > > original code looks buggy and this is a fix. Fix must have functional
> > > change...
> >=20
> > Earlier code already checks for all conditions, including all error cas=
es.
> > So the code being removed here has no effect, as any potential error it
> > could catch will already have been caught by earlier code. Removing it
> > therefore doesn't change behaviour or functionality.
> >=20
> > I can reword to 'incomplete test' instead of 'incorrect code' if you th=
ink
> > that's more clear?
>=20
> Perhaps you should mention which "one" in off-by-one that it has no impac=
t.

OK.

> I also wonder why you left the second - ext_control_s2mpg11 - untouched.

Could you point me to it please? I'm not sure I see what you mean.

Cheers,
Andre'
