Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAE347532
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154676; cv=none; b=ON1vOqwpE9ct1L8duGwj7kSGk2ih/e+g94rHSCRnKxy4sPxD1F6UMQPUIEKxNlx6hyGXGtm26cLvI8eg/mlB85kLih7oSqOmKJ6XMQ1mXsJHxmd7s69PQFTEBO0vtp0FMkrdVmIltuyx7DSuXeplgp61Y56q+iaCYUwRjR1MzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154676; c=relaxed/simple;
	bh=Eci/a/8tHg4tTZJiIfDpEB3IqM/YUJ/xXRXY7o2DXVc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nzxwnNP1BzBQUWOuLoor0JIpdenTbwITkmXsCyxPh9hX+uNSlj4Lbo75F2WAaCiiVTtZXPdb0nsKeb1z1aSCrpvwc6DPYbxXR4lJbA1E8nJ4rqIoyziPxOQxCc7s7DFCGf0rJvgpNvU3Ykbs0W9+D3Bt9tPQb251xBsSsuDmH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKjSs/8X; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKjSs/8X"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4631679f204so113574f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782154673; x=1782759473; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brZs3+MH5gJMBhPZfGjHt4FXO3H2ccunenuS6LTLrkg=;
        b=TKjSs/8X4fyrzk4Qode7dCVl4Uyszpotigbr10WpOgJXCgOc2yJIf5k1acFWwlFmC0
         O1yPxyS6uBOkUVkQEroT6g48T86oTWGzzmjjeZNtYITGQlzgsqjaUUzP0QWEGWzrEBd9
         qn1FjtWm9AYz7GgrHhvAFytG5cf4cF2WPWuRgguXd2qXuwmtDN2FEPffgfFG/9SkAHLF
         4Ka2x/rxGYxu9PcTAXiWTnhUHfomyQA2G0kOjytt5+L3KqfpXicTtjJr2aw5LUIP3pLs
         8OnVRg8Tmlm+yIvK/iRvqqCQuTRMur3oinc3h5K9XsQlk0DjeI3fTiHqMAdVM3DHTmq/
         TS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154673; x=1782759473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brZs3+MH5gJMBhPZfGjHt4FXO3H2ccunenuS6LTLrkg=;
        b=bgHHgUdGGBVf9Xsr2rvdb750TvBUNnzCJhoSX4AM/WoJ87JlbZ+9sKlRd7c1nwMG6F
         4MdjRBhUDJSNBwIfHEiAhYfPA7TyrbcIFeeaDzAqC2KjdsqP8+Xw6fj9rQaRMKTpDupr
         DnNgv9u7vU8iyCRF51mM5bN3pJu3UOhmx2Ibx3ca34sKWkNYxBwtfT+5vIXTsR0Rlh/M
         6KQd3Oed/510Z3+fT1A/eu8CQpqeWtmTgCv84H3LL8URTet0XtFkbg+1gUk+fSQz+CIj
         xg6F0xRK2GgPbvV9B3iVCop/VT1JWaFa5rLGrsZJwWVjdBZ9KQ92PuCSm1P5jtRFC4tG
         nSJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqx7rDuFr6lc+Pf3p+D9pO3ppVMUJozyLGegGSQxn36YfCK0V8CUEv4rgpyhdvwFCHDJ7XOuQJTyhc0mQcM8DoNeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WDkqz2Xyq3kMNwYVTW1mRIW37Lyr5LqeplkxvGXA88Dv/Nw7
	hIb53Blqgn4tteCNKNFcAQUK5A1G5ejS3vNRKDCR14WUde3PPPEzvlNRA2n918hYMiM=
X-Gm-Gg: AfdE7ckQRTfFfcOaIFo5wr1Klu6VgRje8pLFj9FuRPcr8mk06tCUxSGcENArJYCc/IW
	49D4lwWmxBkftWdgkO5FiZX3Vn2yJOD55QkH5hcFn/dWeboG2sqYWC0GIT4DH2OXoHZQ1xS4KUH
	U1Mv1fQqreSLoeX/Zem3K0ITA9WdopcvDD57HUPEMUGQU2LuqNipay+LXkLA1DSYvrcuND5A+n0
	ncNuQtvX0zjmaTRrGhQrHyEd4TWI90WQTlQecBUNQL08yzSfAIcrNpVkz++bAqf2PzsckVGtvuO
	BnylKMIdaXIFIsaDJwm5dT2+Yg78lLONLKwrbf6w/4O71tOqot/OZeWxe5EraFS1NilZhOsQu6P
	S2btDK/roAqCP1S0X0nBfJJ2KZe3hNmGxRYYlpZGQ1/wZkueC881gs8AjTfbtYcMqMsIrMC3ruD
	P2WNTKNz5uuID+J6xK7BYB4tPT8mKRg8bo/7MSLE5l0soYUO+xKxgaUNN/R9dQvEocQB0Be8SUt
	8y2ZBdk55UU
X-Received: by 2002:a05:6000:220b:b0:46a:6474:839e with SMTP id ffacd0b85a97d-46a7e9f3eb8mr1087064f8f.4.1782154673472;
        Mon, 22 Jun 2026 11:57:53 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5413sm29609719f8f.11.2026.06.22.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 11:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 19:57:52 +0100
Message-Id: <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
In-Reply-To: <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>

Hi Peter,

On Thu Jun 11, 2026 at 8:07 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Wed, 10 Jun 2026 at 16:07, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
>> > Hi Alexey,
>>
>> Hi Peter,
>>
>> > Thanks for your patch!
>> >
>> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> =
wrote:
>> >>
>> >> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignor=
es
>> >> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(),=
 and
>> >> register_reboot_notifier(). If any of these registrations fail during
>> >> probe() routine, the driver returns 0, leaving the driver partially
>> >> configured.
>> >
>> > I originally made the failure non-fatal because the system still boots
>> > without the notifiers registered (and all other Arm64 Exynos SoCs
>> > upstream don't register notifiers and AFAICT have broken cpu hotplug
>> > and cpu idle).
>> >
>> > In hindsight, that seems like a mistake. I think your patch to fully
>> > unwind everything in case of failure makes more sense.  See small
>> > comment below about destroy_cpuhp_and_cpuidle()
>>
>> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
>> return any errors?
>
> I suggest you re-read my above comment above ^^

Could you please clarify what specifically addresses my question about
notifiers?

Looking further into this, it seems that, for instance, if one of the
hotplug states fails to register then tracking of pmu_context->in_cpuhp
becomes broken.
If reboot notifier silently fails to be registered, then it is unclear how
this from gs101_cpu_pmu_offline() supposed to work:

/* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
	raw_spin_unlock(&pmu_context->cpupm_lock);
	return NOTIFY_OK;
}

If c2 idles are used during reboot/shutdown then they fail or what?

I am not saying that patch is correct and some rework is needed but I don't
get why we should completely ignore errors from hotplug states registration
and should not check registration of notifiers. At least warning should be
shown to user that pm functionality might be unreliable.

Best regards,
Alexey.

