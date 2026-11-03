Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671605;
	b=bkX06SYrw7s8He3Xsz1RN/IaYECc9WeW1voQyMBQiaaex0nVw2ZrctxkwLkpxptvh0QU
	 LZE9sJXdefUoicNqlxnDtggMawcUgI6SxzcoU3BA4TbH+qbTh2S/Q/UhSLgzqNdfDfK18
	 AavzL/4lz5qHSFINMaNTb5GecvtMclUB1uc2G76NxfVFN00k66+7DRVZ/3MolToOX3bVy
	 vzoAJoYcc4AOavQIxk1dztewmi8NhyGXGsPg+kO45kGGNv/++2dB3SIY5MLFQS27QE5ST
	 7p4eqEtuAqfIPkOy0/39skgo7Rz1lwaC0JXEJQGodRvJMkRYWz7+9ye8Rn/31GkZIQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
	b=MB959czkLJfe9OR1MOUO2EMYqPt1Xe0gsJq7gJrpDbhV/kFOj9vvgFPHQ76l70Nr0AZo
	 RdNWPvuv4u7QNSsu6fIWK1Ooitf2Xyvfypvv6qG5g3zoQs2UCPUeg4d4GZYzBK2Dj9+iC
	 KY4I/KzOrQG1T0NA6Hjrxkko7ndIj0OHpxoHxhxFwGRzM/+lzKt0HZMF7ri2yyGWolMMv
	 yssyyYYIZt75PNnZ3mF8GpcbkT4++Xl3OY40xwjRyj7spodfM0h445RIbWiA0J4je8Lda
	 gvv9jt1Li5SzCtMI3nljgNluxd9x8l0WbSlPN6/ipgczsFGH6W5Usp78Yu8nQl1tToA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F345606D808
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 02:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F345606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so6938230eec.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2026 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671599; x=1794276399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=mAQ0+p5lGe83v747xCyqCS4N8Akjbdkj3F4Iz2/8iImspy/v52+UuU1pE1/Bf6MR50
         E2qDfWgV7bzTU9JYVsGuVRf/bSzdw7SGqRzm0piGjvkzs5eN3BDwZTqZ3vUQsCyWwqzT
         eKkyuVd25qAhw0WgVLwLZD9VIBXnP3Zi75qdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671599; x=1794276399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=j+wbzBoM/aArdUFwmiA8sNr4E4PeJak7kkf6YAUCoJg/mpn2zOLveTkY6R3yQk+YJd
         dDmheRWfs6O5cghn7n2Oa/4qpYdeZ/olIh9LTZ2rsMaymxCzUr00/xjxHF3+dZjmUYs9
         dWcs/i0Obex2FLDMDxQI3Bkz2tSsz9MJMdyJ1mXg9uYWp+kl4P2OF/ok2NA4MZHSYwNx
         xGnccA3iQ9MsQ3rKArB5/m2NRkKt3DmIm+KS6GpZEJENixL0R/C9emgxkvI5kf4lQdoi
         EsFmXg5OHCn/gUGVALNHRQoPuU0c58om7aq9HCBlNXpPiJKgbzNXqjvSft7zk0RHecKN
         9Ebw==
X-Forwarded-Encrypted: i=1; AKwUvByU/JDZpBnoC8uE+HXg5E0NBZcu4AZQrijhOFFHMNgQX0say89y4J2bN95BuNNV9Ts1snYsGpaEGl1iODxGgkF16Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLG7yrQdoER8GwTP6bXK9Vsow//iuaJ6Vhb4EWKpjcWk/Cevqsd
	U33JXAKkbgS3VZffqZ8VrDjxB0cA698bidnaw9X/eVQBJIWdoJuJUJXX/t/iGvxGLw==
X-Gm-Gg: AYBFou3arVvg3ygha+T4i/cEclZj5wKR4V7YiiTZD18mBQ4WyKyZg5T2Lsxp4JVqKlX
	QTYCvdJdJ5hlFLumL5k0R4a57WzjQw0jzKc0EsaMIAlzDiCbIa3J6u/d6CnLbkE7DgI01F70aC9
	+3arNbffR7LY0sjkj1VuYRN/7AbACKAx6qPnkqTOsUK6bSBiV1XasIMMltp8CKlcN75em5PpdiA
	/eHX50/fF8kr2LqiQh6pV82lFBMW9Aednd1G11+a6YamKz4bnpUePkUD8Zkvucy1x8a/QhSFTFz
	B/E9i7YPaZZZjmWAyoJL9lpYFjNAyBu902o8xUnfTe23WGAiITAfCfQkZVZP9L/LuiYKl68CF7Q
	8vTbKr9Th6NAq0KKAIcNKh3EZq4arbJLEyGjxpvkb3EkTYKlQI/rnzBCAohZqN1+1g57EHkI40O
	dqZRImBVfY4eAkcCeelXbtAqiuI4oEl7kTqhjPW8AU00h/0mPnufDoz3SjNnuLzyN9BCgVqAn6G
	e9WeAHR+X08l1fDKwPCXPE8lhje58En8UECxbnc2R9Ww1jp3smR60UH7327zX4QWDlb0o/OS7H2
	mXtDy0jnNL17sKCrkZWq97tgOqc8ThImRZwWFW4wR3ndnqXI7jcqrsoyn8HR8DrFdw0=
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr3971156c88.3.1793671599060;
        Mon, 02 Nov 2026 18:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac19f4a04esm37837284c88.15.2026.11.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:06:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:06:36 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <aulBrFWi54E6a7Br@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261028-armored-glistening-cheetah-6f3070@quoll>
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
In-Reply-To: <20261028-armored-glistening-cheetah-6f3070@quoll>

On Wed, Oct 28, 2026 at 02:24:35PM +0100, Krzysztof Kozlowski wrote:
> Either you expect review or not. RFC means no.

OK, PATCH.

> If that's patch, then at
> the top level of cover letter, as the most important thing, you explain
> the dependency and merging proposal of this.

OK, I'll try to move it up. To be fair though, every change that has any
dependency is clearly noted in its below-the-fold notes.

> You combined here like 5
> different subsystens...

What do you recommend here? I believe the general principles of DT
binding development suggest there should be a single binding doc for
describing the "Central Power Manager" (and the services it supports).
CPM supports functionality covered by many subsystems.

While in theory, bindings can be written without corresponding software
support (drivers), in practice it usually works out better to develop
them together, to prove that the binding describes the hardware/firmware
sufficiently.

And even if the binding goes separately, I don't think I can 100% split
the driver support by subsystem, as they all require the same underlying
CPM helpers, and those helpers don't have much meaning without their
clients. So some multi-subsystem work is still necessary IMO.

So I don't really see how I can address your complaint. But I'm open to
your ideas.

Brian
