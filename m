Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B832E130
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 06:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705530; cv=none; b=mQnknJSFDwiWPqlzLWeBcALlkwfMiuiZYHhGRN2N57WjiH1viE1ncc/GguACueZ5osogWRn4ydHzHD/rkTMaFJrjbWnQ7MH6Xr86R1kJNCWaG2ErIFfyAosXAqtu1CZBE2cJ1a7s28LkpA5oV9y9VBSVQgeBD+G4n7Q0qcFzbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705530; c=relaxed/simple;
	bh=Tzvqbf/lzUX+Xryn3wOPmUQNw3pnqvGuG9huSDJZPn4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b6ZyuIdcVymsBxjnEqkIEfO5IxpIR0PsWyCwi1ZTIvYGM6M3CJ0+8jJdoD0RiKFutsr3SfUI/Ql7bSMnFf1KbYww6kAYaeRBHSNPRTw4PHj825j+E/pSNG4oPzhg0AhW6pdA4geZar2YqeJrM1mvzkjRnn7Lap6JiSX7iqWU6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPaMhkZc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPaMhkZc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so49449115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770705528; x=1771310328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lLdYDGt/+DrOZdYJB2wqY0IBiaBFC8iK50DATmXPJZs=;
        b=aPaMhkZcfXpmP2tm/iJaq/CWcrBT5oUwIPYKVQunfq07wAHYn5QH79di58LjJZCCKZ
         ElWls/ygW5HHWkNDwOfos/MTuCMj6r8QfeKoK5qeFFRXQZE0Jzb5MgWfuIQtwbB7SgTI
         t0w/NgrN4Qvdqu4Ro03urdFF/zw5By8GRlEd50bbXeMHCJ6oVqTrqwaUwvztZSeCzJcn
         3+NfnuTuWPqRVUpRVvW5khABjNpmtMnLrM/nhazeMNrk05OgjuO1/R8+Jr+2tBrXsHtU
         wndcURxtIj4wsyMcBnt+G1R2Pj/3iRi9vELwS8GP9yQLL/vDhAW/ntof0pq3Aw01JPGf
         JTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770705528; x=1771310328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLdYDGt/+DrOZdYJB2wqY0IBiaBFC8iK50DATmXPJZs=;
        b=u7NEZHh2H/QTKzFMmIZtpgcaZKmKauWz/rW2MCvvm0t3l4dA/PkTniqD/uKC9722tJ
         74aAhGVDE3qwYmoKwEyxGrtYGsVHjdLuwZlGrCoRpocC4IcorIgWX8SoIrN5f7OB1H7M
         WHTG0vzojCggLnHZd1G6KEFOXskwf2zlQwooOXMGQl9O/fardK9kPXLIb/lUxXGG0OCq
         KwE0/5LXNV+9ZkqvF444xu4Ycm3YfrtmjA7+e+xGlgGxx5bIRqsLWaKe40tqS8gmPpxl
         XSnz5Bh19RCCNLiv0dn6dJOoC4vpV2ApuwxDQ2tGUlk/EoGz+3UtOlZpzgduhvCANTVD
         FO5g==
X-Forwarded-Encrypted: i=1; AJvYcCXuoGhw0udTeWhIP99swmRMrZH+ohUSF1bDaMs/Hblb2pWbrp1qksXFnDD8NRA4enQtft9FWuQDoLtPG6xWAIxmBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxczJCcWZd6h4/z9cpzwgkObGET9UuvYuP/iuJTUc0Hgiv4UnQu
	lgL69acjWu1xpZFEi5qg99Nnu7J0j+yna3XyEGR5FgXfSqFjVp4XZFihZ1auRRGDvOc=
X-Gm-Gg: AZuq6aJ9nF6HqpdVoujAaDmWZssFhLxNu5uPYSY/kW1bPo877EEex5WVTSh5I8fIjlZ
	sMNS9pdFdpqdrxWqhTB+WQ9dLQ4xVjfIdEtuzS4mLEbmZUd/w4SqbcZwAhNQyv26xftbpu8mJRf
	5FZQSs/fd97EWs9IXsCTqCTNeBfFcsC2/wPyrIpG7u5bCmCU/IkrWwH1fje/aj/W1OcYEO61L/m
	u0gMfQ5AVFQWwH/REmgqQQaJyx+0XaCcfQYtrWy7Cv11aJaQAdoNziCiuGgFIJJ6yR3zfc50GQy
	kaUzQvf1wF1ZkWJrT6ln07tXWraHTVpiBZJ4OwnbOGP2TPp02BE6tzErKzIE647NHvGRzOt15rh
	dct3wC3y6h0oVMXVaT5RKG2OafmWQYGWjHdIMUWugm2Zbk/tYLgqCCOUfBA8/0k835KjwWUyidz
	59dLTnhmVVUHeDIn+P9kJhrVzWQSZ0Mg==
X-Received: by 2002:a05:600c:c086:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-4834ffb08f0mr12556465e9.16.1770705527668;
        Mon, 09 Feb 2026 22:38:47 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d8334a8sm37397915e9.12.2026.02.09.22.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:38:47 -0800 (PST)
Message-ID: <9fce298c842533bc6ede7f1a97040337236351d8.camel@linaro.org>
Subject: Re: [PATCH v5 4/5] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Tue, 10 Feb 2026 06:39:14 +0000
In-Reply-To: <277e1c95-e221-4c07-a00e-d0f0a1a7553f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
	 <20260203-max77759-charger-v5-4-b50395376a5f@google.com>
	 <3ab2d8cd112441dc1d7ab5097f5b1b64c7e415ab.camel@linaro.org>
	 <277e1c95-e221-4c07-a00e-d0f0a1a7553f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Amit,

On Mon, 2026-02-09 at 16:42 -0800, Amit Sunil Dhamne wrote:
> Hi Andre',
>=20
> On 2/4/26 4:49 AM, Andr=C3=A9 Draszik wrote:
> > On Tue, 2026-02-03 at 22:50 +0000, Amit Sunil Dhamne via B4 Relay wrote=
:
> >=20
> > > +
> > > +static void psy_work_item(struct work_struct *work)
> > > +{
> > > +	struct max77759_charger *chg =3D
> > > +		container_of(work, struct max77759_charger, psy_work.work);
> > > +	union power_supply_propval current_limit, online;
> > > +	int ret;
> > > +
> > > +	ret =3D power_supply_get_property(chg->tcpm_psy,
> > > +					POWER_SUPPLY_PROP_CURRENT_MAX,
> > > +					&current_limit);
> > > +	if (ret) {
> > > +		dev_err(chg->dev,
> > > +			"Failed to get CURRENT_MAX psy property, ret=3D%d",
> > > +			ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +	ret =3D power_supply_get_property(chg->tcpm_psy, POWER_SUPPLY_PROP_=
ONLINE,
> > > +					&online);
> > > +	if (ret) {
> > > +		dev_err(chg->dev,
> > > +			"Failed to get ONLINE psy property, ret=3D%d",
> > > +			ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +	if (online.intval && current_limit.intval) {
> > > +		ret =3D set_input_current_limit(chg, current_limit.intval);
> > > +		if (ret) {
> > > +			dev_err(chg->dev,
> > > +				"Unable to set current limit, ret=3D%d", ret);
> > > +			goto err;
> > > +		}
> > > +
> > > +		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
> > > +	} else {
> > > +		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> > > +	}
> > > +
> > > +	chg->psy_work_retry_cnt =3D 0;
> > > +	return;
> > > +
> > > +err:
> > > +	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> > > +	if (chg->psy_work_retry_cnt >=3D MAX_NUM_RETRIES)
> > > +		return;
> > I'd say this final giving up could benefit from a dev_err(), while ...
>=20
> I want to clarify if you want me to add this final giving up print just=
=20
> once or every time I am returning early?

I meant something along the lines of this:

+	if (chg->psy_work_retry_cnt)
+		dev_dbg(chg->dev, "chg psy_work succeeded after %d\n",
+			chg->psy_work_retry_cnt)
+	chg->psy_work_retry_cnt =3D 0;
+	return;
+
+err:
+	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	if (chg->psy_work_retry_cnt >=3D MAX_NUM_RETRIES) {
+		dev_warn(chg->dev, "chg psy_work failed, giving up",
+			 chg->psy_work_retry_cnt, MAX_NUM_RETRIES);
+		return;
+	}

> >=20
> > > +
> > > +	++chg->psy_work_retry_cnt;
> > > +	dev_err(chg->dev, "Retrying %u/%u chg psy_work",
> > > +		chg->psy_work_retry_cnt, MAX_NUM_RETRIES);
> > ... this one could be demoted (but doesn't have to).
> >=20
> > That'd make it easier to determine if it's still in the process of
> > trying, or if it has given up fully.
>=20
> I was assuming the printing of "3/3" would indicate the final giving up=
=20
> and sufficient.


If you see 3/3 in the log, you'll know that it has scheduled the work (for
the last attempt), but you won't easily know if 3/3 has ran yet or if it
has completed successfully this time or if it was still unsuccessful.

> >=20
> > > +	schedule_delayed_work(&chg->psy_work,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(PSY_WORK_RETRY_DE=
LAY_MS));
> > > +}
> > > +
> > > +static int psy_changed(struct notifier_block *nb, unsigned long evt,=
 void *data)
> > > +{
> > > +	struct max77759_charger *chg =3D container_of(nb, struct max77759_c=
harger,
> > > +						=C2=A0=C2=A0=C2=A0 nb);
> > > +	static const char *psy_name =3D "tcpm-source";
> > > +	struct power_supply *psy =3D data;
> > > +
> > > +	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
> > > +	=C2=A0=C2=A0=C2=A0 evt !=3D PSY_EVENT_PROP_CHANGED)
> > > +		return NOTIFY_OK;
> > > +
> > > +	chg->tcpm_psy =3D psy;
> > Do you need locking here? What if this is changed while a previous
> > psy_work_item() is still executing?
>=20
> I=C2=A0 don't think that's ever possible in this case though. The power=
=20
> supply that this driver registers is downstream of the tcpm's.


A previous work could still be executing (e.g. due to retrying), no? It
should also probably set chg->psy_work_retry_cnt =3D 0; here, to allow it
to retry up to MAX_NUM_RETRIES when a new work is queued and a previous
one was unsuccessful?




Cheers,
Andre
