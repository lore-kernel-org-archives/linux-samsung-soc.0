Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010A3F3290
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764290; cv=none; b=f/KQuf+nL/9ZSwreArRWLEU6YUNyv646DSdirFBfiJ3dh1FcN82zx7e5M3JGxBluEO1FZLo1lZjhXYbNzZ2rj5kZs8eiDMVnbeUDevhGpi4yK+xUwoXiXH3gwkt4C5vffhjF4RiOEG6JLc320wpMclKLjZBY0qnvtwX/u0nQ1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764290; c=relaxed/simple;
	bh=l76vJB//fiv5NUToi24XYVgUjHJscXal8jTd8z2f55A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwadCIgpDmSoYDnjHAcC0npC7qP1w3q/O84n7q4+SSJp/xj2brET3az9Tf4UPC37yeS2+NZt0ep+y8K7jbQAD4sgESApVjEAxiNqpHftJNXk+xF0ctTXxVyyl4BGBmaZzhfMJf2jA91UQvMPRfNtBKRdBY1s0LR5lXjVDOYtFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h3XuoyKw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h3XuoyKw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf452def93so85605ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784764288; x=1785369088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=h3XuoyKwZmlKrruWjd31K78zdsYQfqD0AkXfe0mfklvzBiUn9AZsaqBcZtXcZRrf70
         0d14oISnkUegynuzomoXusI/3zGKOiDevMrfi/86w8Ho2XyTwJGVzo13oADpITTfClgz
         0VwVrz1CMaMNdWppzur+c5M7KxlY19DKsd4Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764288; x=1785369088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=BmJZtt1RdUmluQ9mawlxcPlNGESzc/HCa9mYOpZrvQfOyDvZSyn7h0MI2J7F2AwWQr
         FqJzz5IzHdcJQJOn/A0WtqG8umVtadpv0jv/yykTbbiHXjWlCRm/afpUGqZYu15BHqJC
         iInatCINrvE/ZiRYMx7dbm2G7N1NjxZH/cIYHn8SnJP2mtSb2+A3E3sqJNKgBPr6+oex
         Gj/ubzN2PpQ5wfLi9Lk9ioaWCrYgwBnmSq0KR9rEKVKntGuGmSA/F9TZluR4yYzUkLo4
         u8fTzkcuPvMB+IITDnr1i9bW4GAln8LDnSEN7FZAgY8mTxgAeN8gX2Z2/e3zaxH593AG
         b6jA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7RSvKKMTphDrsVQvRSPsJ+9TkDVO+oohTm6zdy9UCPupwZVHwa5FTTTU6LUrSNp+BgksxD2O+5cKIdV420C8Pwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvUV3VO2yQn7O4hsJbWRbSq7F9rZcmHrrrEjd+HejVw+5TO+P
	2giZnJswXMScJyzSIpYZECiWX2unN3vzDQrhF1Aln2jKYUqg2H2zIQX2/uu3i2aypA==
X-Gm-Gg: AR+sD11z4SY0mcMHCPSSpTrzVKdm9YtLRc2Z+bTrFupAXaAk3stdIXVjSVjlMbA7Wvb
	mVHXPUKzVroOAQ+5KSiVHyMHLh/tDjKApMBfA/Tf+Z8Sb9BOqVvUgrYzVUZHsfAC9IYq3jAlvEs
	DbUq9Puk7XOuJGiKukmfDO0PjxKXA1dUOrzwGdT+B+KgfVQYj0qiL+vFe41uQoBILXKFHgSBclr
	4ZIJyFEIy5I5rV1lf5KIui2sjXHgm59HfaprsU8InfbFozWsH3tdGMGd8RwreKtEpMIKSWbhlS+
	l8Ilv4sRyURTHWQJx6KcZJRzG9Uw0hmI55nkR7eoW9YEdrMVtqyCxlj/mCJj1RcBUqlJFKw7JwJ
	CVZpgkEf8gLEfmvVjILNQmIvgKfX85nsSrQNSa433Xf8OuPsogVy6XqTTZzyIgJthdsLwyJ/vtS
	XtG7zJwWgpdGKwa8lRvR0wy/+ssd+1LDESJuPpUG8cxtNEE+75psM=
X-Received: by 2002:a05:6a20:6a26:b0:3c4:2f75:719 with SMTP id adf61e73a8af0-3c44cd1de09mr386413637.37.1784764288427;
        Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:f3fd:a899:78ad:64d4])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3147e07000fsm25313445eec.21.2026.07.22.16.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:51:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:51:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
Message-ID: <amFXfFFSGfqReFWO@google.com>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>

Hi Peter,

On Wed, Jul 22, 2026 at 10:55:55AM +0100, Peter Griffin wrote:
> diff --git a/arch/arm64/boot/dts/google/lga-pixel-common.dtsi b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi
> new file mode 100644
> index 000000000000..57c318ab44c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi

> +	aliases {
> +		serial0 = "/soc@0/serial@db62000";	/* &lsion_cli16_uart */
> +		ufs0 = "/ufs-placeholder";		/* &ufs - TODO "/soc@0/ufs@3c400000" */

I'm going to go out on a limb here and guess that these aliases are
being spelled literally (with comments pointing at their label) because
they used to be formed as overlays (where the label won't resolve
properly, I expect?).

Do we still want to spell it this way? This looks generally nicer, and
won't need an update when we get a real ufs node:

		serial0 = &lsion_cli16_uart;
		ufs0 = &ufs;

IMO, we can cross the overlay bridge when we come to it.

Brian

> +	};
