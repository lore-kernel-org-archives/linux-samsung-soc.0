Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C351CCED2
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.41.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727809624; cv=none; b=aIRxEHonvK8qYvq2o4UFs2Iz+K81tveVPn/88LJGPmzSY3Kx0lS6HjeV9mTSzTqvF00OYq2TacDG7JR+qTO8Z6k6vJmWAC9CaoX9/Q/2gx6G/uTuxTMmLn8HiAefIYDHhDBoA/RgUPSUtrA1dQ0uA0Rllx9lOPGab65JOleKEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727809624; c=relaxed/simple;
	bh=WMBcmqwW3KXWeuGqI7cy9FCO3tNUMUnEUsXZINP5irA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZnsRoRdHRI1uHNZsvfgVeJT6XGqM2xx3+LFVYUXNqIgUM1tGNftGPQC7SBV+F5lqzkYrDVYUp8Fb3Uw+RVzkoEHrC3wYNIuzq4PqEpZjDCXwMbufyG9p2v61F5t+j+noVFEK0RyxHIFVkSGLCqkJjPxj5JzcFdQGYGoMqxPqqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TCf39+HD; arc=none smtp.client-ip=185.70.41.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TCf39+HD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1727809147; x=1728068347;
	bh=WMBcmqwW3KXWeuGqI7cy9FCO3tNUMUnEUsXZINP5irA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TCf39+HDWBazKm47HhtA4S5bXwSekV6ou5GESJ6YVYwVEE6bG4QJ4EJQu4tBTNiyV
	 R6b41/lEt0/lDsa5NmVLKbQPNlcU3fbgRxF+beGhAX+aaYAHxJVvUnHd0Yls+D1zRP
	 TbQ75qrXGtWulbJtzHMkx5jx6vZAI7PW5IkMSBnb8SLgAt05EO9JftpenOHoC1gSqH
	 gL7fikptEPYjtPhy9t/y6bmHoeI+blxfafuU7eu9KXxkOzAbyboaZpyQRBM3UOGIBl
	 QjMFbEvKZU7Nl7zBu9MZs+qftLNFQQ7xxSQld+evjmH/PhVDxL+4OYaAxiFVnyq3Q6
	 up457lgMwjGsQ==
Date: Tue, 01 Oct 2024 18:59:01 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: rbredhat <rbredhat@pm.me>
Cc: Henrik Grimler <henrik@grimler.se>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, alim.akhtar@samsung.com, markuss.broks@gmail.com
Subject: Re: Exynos 9810 and Galaxy S9 (starlte)
Message-ID: <SvziwnUV8woHQyfcdXtUC5VrRm3CRYA70oLsNewuzfe_l8gNKLCIBSnzK7AFyPinT-0lXclz8y7gbmADEKusYChGHan-aHCmJJQZJGKG2tE=@pm.me>
In-Reply-To: <822f317e-d4f2-41de-a6be-162ab79b87b3@linaro.org>
References: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me> <20241001120130.GA6468@samsung-a5> <822f317e-d4f2-41de-a6be-162ab79b87b3@linaro.org>
Feedback-ID: 52807168:user:proton
X-Pm-Message-ID: be71f1c8d5c786730615e8db1b8e347a0f4f49db
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof, Henrik, thank you for the reply.

First of all thanks to everyone who is working on adding support for older =
devices to the linux kernel and alternative OS (such as Lineageos and Postm=
arketos).

> Just FYI, the original email was sent to me already in private and I
> responded. Although I am still confused what is actually the question her=
e.

As an outside observer I see a lot of work has been done over the last 4 ye=
ars to add support for Exynos9* based SoCs to the kernel. I understand that=
 my question is rather directed to Samsung and I was wondering if it is pos=
sible that all Exynos9* based SoCs will get at least basic support in mains=
tream anytime soon. If the answer is no, as a potential consumer I would li=
ke to know if Samsung is going to adopt Qualcomm's practices in mainstremin=
g code for at least its newer SoCs?

From a hardware point of view Samsung devices are amazing and very robust. =
I can tell the old flagship models are still popular especially among the e=
lderly users. But from a software point of view it is not safe to continue =
using my Galaxy anymore. It makes me sad and a little angry but I think its=
 time to put this smartphone in the drawer and move on.



On Tuesday, 1 October 2024 at 12:09, Krzysztof Kozlowski <krzysztof.kozlows=
ki@linaro.org> wrote:

>
>
> On 01/10/2024 14:01, Henrik Grimler wrote:
>
> > Hi rbredhat,
> >
> > On Mon, Sep 30, 2024 at 06:24:16PM +0000, rbredhat wrote:
> >
> > > Hi,
> > >
> > > As a Galaxy S9 (G960F, starlte) owner I'm glad to see the progress on=
 adding the Exynos SoC to the mainstream. Is there any chance that the Exyn=
os 9810 will be added as well? There are a huge number of devices based on =
this SoC:
> >
> > To my knowledge no one (individual or company) is actively working on E=
xynos 9810.
> >
> > > I am able to build a kernel from source code, but the 4.9 branch is n=
o longer supported. My attempts to use a fresh version of the kernel failed=
 due to my lack of programming experience. I have created a document listin=
g the components of some of the devices, perhaps it will be useful. I can s=
end the ods file if needed.
> > >
> > > https://kdrive.infomaniak.com/app/share/1019122/185f83dd-e5f7-4224-bc=
76-ebc3e7ccb821
> > >
> > > Some device versions have Qualcomm SDM845 SoC and are already support=
ed in mainstream. It might make it easier to add support for Exynos 9810 ba=
sed devices. For example,
> > > https://lore.kernel.org/all/20240926-starqltechn_integration_upstream=
-v5-0-d2084672ff2f@gmail.com/
> >
> > Indeed, thanks to the great work by Linaro, Google and individuals
> > like Dzmitry some of the core SOC support and drivers that your device
> > needs are already supported. I think your best bet of getting starlte
> > support in mainline linux would be to find others interested in this
> > SOC and work together to add it. PostmarketOS [1] provides a great
> > community for this, and its starlte wiki page [2] lists a few device
> > owners, and even links to a WIP mainline tree.
> >
> > I have added SOC maintainers and the WIP tree author to CC, as people
> > tend to not monitor the list.
>
>
> Just FYI, the original email was sent to me already in private and I
> responded. Although I am still confused what is actually the question her=
e.
>
> Best regards,
> Krzysztof
