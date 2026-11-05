Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898763;
	b=h7yhRSKDDChbhDZl8gMn3tpWXE8n3cZhBd217uZx8YDRQUF+FkI/t/EgAaFGH1nlGC81
	 tEXPjtQNfExUYxYmdajmlURVmhxFPDNKVNgnLTFyJT8wCzrZGR1EaarPYvGxOJ8wPE7Qa
	 PAft3sXAsxSy339chRHZKIDjEG1wPeDsBni8Wx8aapXQKZlLwXQAvbi792NfJBtvMSSuZ
	 N/UjbL0q2B4a8+S9AUoTQ6wYXztOt9M7ryPcJGS9ZeB4JxyhNYxZfNAnM86Lekd7TYi5M
	 sn6DaAXwetcpOTJveYsKJOgyW9X6OqB+tToBnPRNxCoF2cDQqQS+kuagBYl9ol2Rmog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
	b=IGLzh1HCUKn5iNki/WES1IMewp6YWckKRq4s3FWWdwH4chPDTOXFaVsMVf6oA4ltHczO
	 oz/EuEEgA5kQuEqaKGFfSiHJ6bNghRk/TMRaWm0TR93K8GovmOkplCInYKgRLuTxpH9+J
	 8dte6n77CRrHKm+hug/B6MnF05xv4VbSMofGFaMpAKfWeaFN+lGzasz4KgeHWt7R4dOXd
	 zp/OQSh8S1muU05Uq+qDWU6DlDJwrERWVfOx9ldGktEdv8F+Bh8yoBgGAUkBJOnKsaK2e
	 4VfGUwC0a4Fv9f45hwVkTkGu4nX6ZlQKsGasszofURSHd4SIxremefdc8uX7+UBHoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o706bnXK;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8B606D80C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 17:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB8B606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o706bnXK
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso956088eec.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898762; x=1794503562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=o706bnXKVTjxwXt+X/Dlzu3lDDS/oYhIZ6oVx9YrgmwSzJYHY/cbyJoukKQFRrlzbn
         javz2xmduw3YbLj6xsPJCdhW1HhtpFr3fLgGkUqDNXIRhH413Xjt3ATblslMssJ1LRii
         ktAv0yeN+zlwz7bjIGZDtR/fGkCmZPk2m6j+AHqmpXXltDVVfHhpa0C3NRWYJq28S7SJ
         wj9wBd1we6ozZuGTsWK4Xpsoj55ENN7gbXk6SHjyGSFyWWLTutoKtWnIncA9F5bQXo86
         ofOMXrpx3t20ydF1cGB9cuEmn6tMm6w768qQsfEMyLKKzGb7ZZt6SH7aLpM/XM/mRuFg
         ON9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898762; x=1794503562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=s3knfZn5hYIpzkpau7qXdH0Hd7qO4XaDC04jTUwmkhQGVfpTiYOlLqirrKPuUm+VD9
         9bWLCZ8WsSYuMwNEXUG0LpsGGpSjauDq1Ije9/dqLuk6rQ3qXXiyD5sZ2mZmiMfJjepg
         5EuZrsKxkMZeAkTcnmf7e1k0qecyidYVG3EqVlAjQlJcaCfAvUpTkk2VfmsyjA1Kem0i
         d1yNOz0ak4h5m3g/Cywxsvras74TrflSmqffE7BAtXD4XndHp+aNX8BNXi0/aLKsKL1F
         TbWX5YoFDHdjqfv8qfCcD3JQk5PU1+iIzqMb9sbMIcsyF3G3VHM60kESy0ur3cIdAkyS
         Gxwg==
X-Forwarded-Encrypted: i=1; AKwUvBy4igrP+AlTMBB9841aNQfnSkjZoA9bqvgNIs42hh66LIEyO8SieC/MXNiO5gTQEB6tMJ7IeVffkRnjEQ++K9lY9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8G97V+pMSBdLSz+wcgQ9EDCX0JDHzdc2hhNDkeBVE1O4tC0/2k
	tWOUXDzklpMc4NiEYcWWtyYa+hObmJ/UwOKeKXqDS+dxg+StQYcNuWcw
X-Gm-Gg: AYBFou3CLgSuZlDtTzhSxo7q/l5uxkxqp7dqv6gDZ5jCHTc0ae2gJmSxP838Flfi7Ci
	O6YWyhkSO8jyMAgu7pNUEuZux+IhYEcpKnTzN3J7cgE3ETi9su5Z+JSSGxqxpnItmPz3Hc9dxfs
	4celST/Ymuja/YbCHfprzpRnAxwCsLv44x8l00zz6CzlLVyiXqdhnXXShAjK0SHanukr4AnOBon
	i7su26oN83+yAiRNEosPEJb5fk/A3cI29ox+CHLb6YWYdbebzntgi7erQkSB8ZvEtcAtvaugTff
	jVwPGSK2/qDwkpvbKhgMIJg+YRrlCU/32WP56zhz5MYkmsX5D2cUx0KssH8zIkymM1WrlIzZZ5R
	NxijDJEGzIZ91GpyClL/0FlPTiVEsD136tqPI7PRvtJTDNejHD68q+9zsocj9vDKUxO/Fb6qEFw
	OIBxRQTspGaFs3wLi2JXEc1+ph93+ilqE3pbnZcpZTOcHAImn9p/0fOU/Slk7SQi+07Db7xIz+p
	AuMEszaxFNqmQ3egC/qOV4wUDuJswUOmmFBXHX3N1mowu7UQrI0MK4/ORe2DtL+kQDZshBvQBjT
	XtXVVfhYZKv1k1mniIl6OaYKOUujnvBeRB7NIHQI6USxyxz6BXEJdW2dc8TJileTrN++yw==
X-Received: by 2002:a05:7300:dd09:b0:36e:370d:2127 with SMTP id 5a478bee46e88-36e370d264amr3168344eec.32.1793898762203;
        Thu, 05 Nov 2026 09:12:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm22255325eec.7.2026.11.05.09.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:12:41 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auy4Qbxg-pW_X37E@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>

On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> As far as I understand the situation, wm831x was used on the
> reference board (Samsung smdk6410, removed in 2019) in addition
> to crag6410 but never anywhere else upstream. The question
> then is whether we'll ever see a DT conversion of crag6410.
> This would require finding someone willing to actually do
> the work, and coming up with a way to handle the autodetection
> in mach-crag6410-module.c so the correct spi/i2c codec
> child devices are probed.

So I guess the question then: do we need to keep this board at all? Or
it is time for it to go the way of the dodo? And then we could drop some
more drivers as well.

My goal for the series was to move along legacy gpio API conversions, as
well as move away from the GPIO lookup tables (ideally I want them gone
now that we have software nodes supporting describing GPIOs).

Thanks.

-- 
Dmitry
