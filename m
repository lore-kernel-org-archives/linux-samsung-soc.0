Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172850;
	b=G8bdkBc+fh/hNqOy5xUdEqvo0+e9I4Fa0TdOkGS8r5nMIcldIVrp7P/Ra4YNrR3iRpyf
	 VYLT7DAMhAL1djvdFI/wdW/EPlaIYSXZnp8wCsv0FEHDWYYDy6+bXrxFmebXOWDFJllng
	 Kfa/A10yguZF2rIgrVyv3nInRdAyw9XHqhALxAADwA2w7rdluISx56dakOJndj+cWdy/w
	 QBwtkpXtoaG5o+wxEJhoMYWApSiH8KCYBcTLi+W+yZdSr4xhjTK50C/wdlbe9OyUm/bzk
	 0w4XcRbd2jxZrsX3SoxqvZ9mQrvGsMJoNHKaaeEbod2wFQPgHQWwbLY0ApX6EkiDm8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
	b=EtN19yr0hhCc3/FtgGOCoWiwbN9oAq3rpd0GPjhK5kC0a3zOY7e0dpNSxWqjouMYNQvz
	 Ip5tDvNA1L5SkYT/ZF+DZxEeaWH01fZt7Liqm8KkpD/UpI1UzA+G/YyCEXpLsQfpiRvjZ
	 0vv0rie4S5fFSGe3kB1o9tjqWhWdzc8ndy4Z/oAYPOHMto7IJK/9jrDG5jDHSa1XBw4i5
	 knt5F+KHVmqCGteDTu1+WxPyyt45l24H8Md3J/Wy4Y9HA+OiXPgvx/AoKHsJlLURsgHNY
	 ledQ9zUmE5UppRElV6Y31NxdK4yjql/W855MiL+CqaFQcnZHjl5HO8raRKlwcifrReQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405560A3814
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F405560A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so1008426a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172848; cv=none;
        d=google.com; s=arc-20260327;
        b=JrBtnUY8C/9xWQcQQdN4banHinuZS6rmW61+DV93JAhppAYzrmdOAV+miLyT9UlGNp
         7xKH2KAyk5Mk4fqhoC/PG9sJbRahW8AdtsLtGBguX3/ZgvEJY60FrjvBnbrjETvVbf/1
         wic7vX31m8yTQowq99P1aoBL9MXAuwm+xil9SibYoEle1hQ13ormBllCNONiST+HTVtd
         vuMmA/ecT26NtB8UxH25whJaII/aW50Rc5Erni3o1NKkRyA736FmAivt020zPqzqfTDF
         0AOBmnlJukJE3f8+TeVCIweQ0XSldwWP+t7MYwov2cF1UNDi3bpjwl33TppsBkYfk2Gs
         FNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        fh=3g3KnRHjpzNV5T0d6iXTh2gTXJOGp3QbI0zJKmvOzvI=;
        b=mTuUTbWjgDLXkyy/ksXnVFFrh7xHj+oZHeiXUSN0qxxYGIUFUA3DB5cH3boGP81Ryl
         J+3iQo53olKIxPhxDg4ntZg+TvngP9fTgGFd/6QSgeaNyoZWQmU1fSFwo2MDQ8KuCKjx
         74KBbTDcbhVKmxBSJFpqjSaScBfOMUwH++IXoi+A9C5ICzlSPd59Dgs8iW243ADKZkVh
         BJ+O6Z+GZ2mwvU7DFA/lVWELJGV2kwG1evZn0Ui5RP68Yfj71lXk1WsbQJDqpTDG0VB+
         QcjAxfW/8TrtUpkvGLIGczYWh0CRnn6L+bRrJvgmoaw4hOv5UJW8dkdBBrlsaGYtx8zt
         rVFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795172848; x=1795777648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=yXseSSBwL667WWeqcwc21yoPcofDc/e/i/a0eCGiiUIrolXJjf8p5oc5Tb4mc6Ermj
         bePnEkY54ZTwInl8DL26psq1wTSD/NFqBAe8CxTmiyBHp1H/jpU84o455nMMjQhhEdEa
         lA1XN4iqiRUxyl9I8P8BVP5yyGg+CpqVfPuEtVWUJ3GwjYCturtgNWaBIXKDoI27wRMS
         eZA2otDBZHbX3bSAsZq6wZS6p8uA816T6cXsXjW9BokYqZBj516ziReL7o4DVqv93sGi
         YtmqSj33RCnGt5u/8A4nKw8q/PDc+udI289bWFav1ty6PHm9KHhQlgCApfj082PM3uVD
         IKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172848; x=1795777648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=iP+Y8j8lD/v8BnjjgofQehzwHSQWuvfsuzY47cwzXj4rS2LE39wzIO1EnHLH+Xcn/T
         Ty6kFEqeZ851lyeLW9WLt8EczXcDjElNVlxaCmYgi3F8pz4zNo0zDDtVFLN/Td677fDb
         uzyIFVhrDdoHU5X509nzFKv6Uq8hY8tjx5OBF5tczZwCjs2kCK7mur9e03iz8OwV+OhF
         hBT7avI2mMX6dVCAXsR+IEH/KoFXAsXXr1mEJZ6uWx0HfoUmpFko9VweZHkDyuXcJlZh
         swxngH5TWai/KK4gLkZWagEtQCm7Y8/YmcF1UI0niOaLff/Mtb1fm24WzBIu2jI7EUCf
         A88w==
X-Forwarded-Encrypted: i=1; AL+hErGmehIZTiP7CMFnISYl75//16JJS5X057mHXkbv2e6fSS3wKhY7nh8txhL3iu4B4vj57l1QVowMcxjEY/OQHaKZCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/1kzjmN7GpoRPI2LpFHvUEth07634STE1GRRQ59blv/U3+A8F
	W+COXzT8ml8HHIq4T/azjyBcxcuywWFEYJdXsiX1MqL0866UxkP/hOl5f5B1d+zq8AIPpz5XiVB
	qxNUmdOdu3Xceihxe8/JCOZL4mCisZSNr3MVBNGcl+g==
X-Gm-Gg: AZFdTZfjMo3qqO99I1UR9lclPTnl06L/VOBEd/s5eWGqjhkredMMWfMUsQNmRzSKYHZ
	SmNpQcOZacAcOv7D3dT4KlukSt/Z/QnxCPLM8n9HVpj0I/HAdlZuW+G+E/BmeB/b6N0V3b8uy3f
	7JwhGUEhSjID3HnHVDeg1/lZn+8guBNiWSgLvlGHceDGddt5muxul/d7ZbQiqvTVqA5GGnHg0xl
	JJfWMPPqrwi2a+RCQHQvHSVDgZtwlt27/5lwvkAXkMXrlZNNEQhXgOfeopzFVw8+yFe2Q7QNGX5
	XiaB+SKUIFKY5iJ/txJQ38JX8fCV3/8lBJXu1sY5nXARN7/PwB15PkzeY/ymWe6wAKvIi0TJIt7
	0YSXkbou+7Dci7U3X+WKOY3/sebjhZTUaAPal33lt6HCVQgzHxr3bZbfLs8B17vVetzMoHmw=
X-Received: by 2002:a05:6402:3225:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6ba37e6f806mr1953110a12.20.1795172848247; Fri, 20 Nov 2026
 03:07:28 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
 <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com> <002901dd77d9$6ddef600$499ce200$@samsung.com>
In-Reply-To: <002901dd77d9$6ddef600$499ce200$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 20 Nov 2026 11:07:16 +0000
X-Gm-Features: Aa3M54pTNJ_y_R-HLRUhtwnIbiMHdLsAfFF3Abu5bW9vYYJErrbwlv-VYU97Njc
Message-ID: <CADrjBPrO43A6XaVK7_J3-y9=bOsjhNbyf8KA6fmyvLJ0O61gOw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Raghav Sharma <raghav.s@samsung.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Thu, 19 Nov 2026 at 03:52, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Thanks Peter for review
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Friday, November 13, 2026 5:58 PM
> > To: Raghav Sharma <raghav.s@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > alim.akhtar@samsung.com; sboyd@kernel.org; bmasney+clk@redhat.com;
> > jbrunet+clk@baylibre.com; robh@kernel.org; conor+dt@kernel.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; is.gandhi@samsung.com; ts.amit@samsung.com;
> > pokala.reddy@samsung.com
> > Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
> > pll_4313
> >
> > Hi Raghav,
> >
> > On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com>
> > wrote:
> > >
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > >
> > > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > > pll_531x except for CON8 offset, so re-using code for
> > > pll_4313
> > >
> > > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > > ---
> > >  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
> > > drivers/clk/samsung/clk-pll.h |  1 +
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/samsung/clk-pll.c
> > > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > > 100644
> > > --- a/drivers/clk/samsung/clk-pll.c
> > > +++ b/drivers/clk/samsung/clk-pll.c
> > > @@ -1306,7 +1306,15 @@ static unsigned long
> > samsung_pll531x_recalc_rate(struct clk_hw *hw,
> > >         u64 mdiv, fout = parent_rate;
> > >
> > >         pll_con0 = readl_relaxed(pll->con_reg);
> > > -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       if (pll->type == pll_4313) {
> > > +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> > > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > > +                */
> > > +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> > > +       } else {
> > > +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       }
> > > +
> >
> > This starts to feel a bit hacky (pll_con8 register being referenced as an offset
> > from lock_reg). Is the register really called pll_con8 on 8855? Or is it called
> > something else, but happens to contain fdiv?
> >
> Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

If the register is actually called PLL_CON8_ in the TRM then the
current patch makes sense "as is". It just seemed odd at first reading
that con8 wasn't an offset from con_reg on this SoC.

Thanks,

Peter
