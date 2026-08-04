Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B53E49E8
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838324; cv=pass; b=Kj9mbPHLbyA/fUz0X7v1xjj5Vz8hoB7OZrODJWivcElMD0/7RDp7Xb4YhCdpSybxH5cqQhxYn69cfKSMV+/phhHOmz5MQJN3rCQN7KDsYkBHz5ZWIJx233qiaZCfd3fVrGS703lSHPr6F6nMklpkZQYKCVdlLci4iBh/+F8bd0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838324; c=relaxed/simple;
	bh=oteyxLemS+IHJBZ/U9bbowhrf6bbX8xAI+nDGXODOWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpBSqZ1Z/nWQRkPrKzzPAVUKnZrlC9KIeP44PV6soX47k3v3KTzjhcqfTUmTJ6APlyCcrCVe6P6yk3d3XHqasxYayFa6PE2NnLIA3HK6lE0Y8G3smQ8NityYO/+lpX6hzIka/vggnKI1xAo9C8Flh8rQtOdgAl8MVFn1X5mZz5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7JwPXxV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7JwPXxV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so429979966b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 03:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785838321; cv=none;
        d=google.com; s=arc-20260327;
        b=HDaOqoLj8NV7YUBMHCN8/kj9gthy2GKaoiQWwQ5e2andjNmaoLyOcfdUXky5SOliUk
         hj+7Qmr+O0b3fs3x6gHetv2KtmCV2o7HjERGhMxf3BpOVaO1HKrBfVjn1Y6zQyecCXnh
         R8h3LgVZviOJnmY6v1Cj/aD35gn4AeVj7wRysAf628q4ku8ZJrR+MphfsB6I/OZBe4jo
         hPHOoATEV9+ydN2Q15pJtf2H3qbQOAw1wspNlU0dP6oPMMkfMpYhW5tKyeqqrubCNXJt
         u7FAeahAJ5unSxK40KeA5xAdnNzcdoIXBKTW3z1ozAQz7oYLrXuzXD3unw83MXLciKaD
         93Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        fh=u4+XVzzz2fHVzqDerQId/EHeWl/fqZY17AMX68DI72I=;
        b=aurxTvuQiji53k7JQxFybxLFnLXO6Ss5IqzGQ1K8GEL1L9MqCvDa3tGSUT92wt1Sei
         +Qzu5WVni7UGHrkDXZWuzuGaJKBu/VVai2UVdXnttcvuK47auuWG/Qy1Y+55KRIYL2jA
         VpzAiu2crE7YXGteRO+17qJN5OOo1v85w71gKS0dXPTYmVID1bv5r6pqG6jmemjX4+Se
         eTzKhj20vqpmUDRpx3W2KYmFW/q69MeTHQN+NH+2Nacz3c8dHP2fmfHH0hjHQm6PAYVQ
         1lCroA85SXWlU5yU1Z+WI3jaD95oXsc6GpzuE/yx0Iwh0DlEmY9FrIA/+zmTSYS+KEQX
         rYvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785838321; x=1786443121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        b=r7JwPXxVMCfQthpB/MUMvM1dq5L67lRLFFsOPla7KLSVKKjLTLvRnmXnqqCp1DEfSN
         YZIGPl4nM0PWTG8fyYNz6x2EAold0oDelbihUtNWxRAFljd+Fmb+O8EgKe33w7cm1vJ9
         wK+YtIrJfuZvZj0SXA8Gts7Uwe6S0cwth0WaBW6Koak1eXXLH0oKj69IazR54bC0Oc4N
         pJwFkWUg2L+4NRdnYnToYpn68WlcDge8lZCC5mJ5Q6CWv4eQk79pu3uovzMnCcF+dtP5
         d3sdZ0sJE6Jmt8GQow0G1Qd1CEbjElFgp0sFoGWGyicFzFN3c2x6v2+zqgpPtublSKYY
         5QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838321; x=1786443121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        b=kIzYp7H7GexhRWAIDsJaXVMOtzUoiCyMFroKd2IdapSPeyXcDeg629+e5MrkGd2Vgo
         UJMFST+DVgcZX53KBCqgoiKvCoLs5tbOOHILAQGCrvDPVQdQ4z1a+/gQla5RrhBFp8Gf
         tEcxjjcH23Prxn3aasZFP93GIBjLE2IEqL0yDYNUYElO7B3z8JBMhEqLTA5ZvRSgjcf6
         92QhAixnooZXegCnqwy4/betk8+nSTHlk+e5UiRVntWm/HUK698ahOw7iY0WV7EHAKxm
         xZda+EmrBh+0D42WPGH94gX17spyATKaJg6CXFUqAtyd+9c5VXUuQN2ZBwmdZR8/yZa7
         zpyA==
X-Forwarded-Encrypted: i=1; AHgh+RpWrjrQD7splQe+I0rHY9qK95M5NDjj6SCPBJiSNnapQUvLaOXpzsmeGs6MLtCPqmND4pMuZeoBNPArqoUo4eM6Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFZU2xq4/wN77reNWuKMTevwLt9RCzDbM75VuTR0Pys9y7Kyt
	eX+zY7YcfMKXwt+GMHV92ewrnSIxbxauzHSKnTuOoDofqtiRCRSTqzaaVkdS/WxYBQnmRV7m1fF
	IW2Kt0c7KfElyxDdkS6IpTGviwncyXkieTMrNw81aEw==
X-Gm-Gg: AR+sD10VVPk+rqMJvVD/aTP4z+Oin38uEj4i7NIBIKEekFXzF/eMP/QE3Pgmr4MqZ3p
	g3taxKfnC/j8v18t71CowG0MePqFJZKdDA0pHxRDM02bL/ASlqw08P6jRBvz0EIbOjF0Fy14QvD
	bI8aGoNNhY3RrIzB36GZnc7up8DcUT7nm5G6v38gUbJ43GhL4yiRB7NcK9yIXlZnUHe9TjJAxoy
	zlszHXyMHenyNck9A1U1tMwLoJwuczV8SV7cy+mQpm3f4yAJqOQIw/h37pU4NWoI2Xcx/+Efc+t
	bpr8byt45fVdREVKlKZz9ggIvvHATR+D6pJRZbwDtDbILTXwn120EmRF4LRfK/JkHTmC9ygYCSy
	6I6U=
X-Received: by 2002:a17:907:c007:b0:c15:dcc6:d06d with SMTP id
 a640c23a62f3a-c1fe7d11095mr1281460266b.0.1785838321130; Tue, 04 Aug 2026
 03:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
 <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
 <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org> <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
 <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
In-Reply-To: <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 11:11:49 +0100
X-Gm-Features: AUfX_mz5t_Pe04iy5Urjl5FLntfM2UaJUBsRQk-xp7uJxfwmN41IPr1rHKikzkY
Message-ID: <CADrjBPpk1beXfAJ7uhKHwYKo1wDPg+qxwfc-PQgZL6dcAN1CDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Apologies, I've been on vacation 2 of the last 3 weeks, but I thought
we had this all sorted.

On Thu, 16 Jul 2026 at 13:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Hi Peter,
>
> On Mon Jun 22, 2026 at 9:43 PM BST, Peter Griffin wrote:
> > Hi Alexey,
> >
> > On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> > [..]
> >> >> >
> >> >> > I originally made the failure non-fatal because the system still boots
> >> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
> >> >> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> >> >> > and cpu idle).
> >> >> >
> >> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> >> > unwind everything in case of failure makes more sense.  See small
> >> >> > comment below about destroy_cpuhp_and_cpuidle()
> >> >>
> >> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> >> >> return any errors?
> >> >
> >> > I suggest you re-read my above comment above ^^
> >>
> >> Could you please clarify what specifically addresses my question about
> >> notifiers?
> >
> > Sure, I was referring to this part of my previous reply:
> >
> >> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> >> > unwind everything in case of failure makes more sense.
> >
> > [..]
> >>
> >> If c2 idles are used during reboot/shutdown then they fail or what?
> >
> > This followed similar logic to the Samsung downstream kernel drivers.
> > I have no extra information about it beyond the downstream kernel
> > source. It seemed reasonable though that CPU's will be hotplugged
> > during suspend and reboot so you may wish to ignore these.
> >
> > The proper solution of course is a fully PSCI compliant firmware,
> > which doesn't require these side channel hints.
>
> It seems there is some misunderstanding, where we are not getting to the
> point.

From my point of view your proposed patch looks good, as I mentioned
in my earlier replies. The only reason for not sending a reviewed-by
tag was the outstanding piece of feedback regarding only calling
destroy_cpuhp_and_cpuidle() for platforms that called
setup_cpuhp_and_cpuidle(). Currently it is only gs101 that calls
setup_cpuhp_and_cpuidle() but in your patch you call
destroy_cpuhp_and_cpuidle() unconditionally. Will that cause issues
for other SoCs?

> I think I still do not see any comment about failed notifiers
> and question about c2 idle states is kinda misdirected.
> I also don't see any answers that clarify this from previous emails:

As I understand it your proposed patch fixes all the issues you are
asking questions about? Is there some outstanding point that your
patch hasn't already addressed?

>
> >Why do we need to have notifiers (say cpu_pm_register_notifier())
> >registered if, for instance, cpuhp_setup_state() fails?
>
> Let's jump to the details then to move it forward somewhere.
>
> If one of the cpuhp_setup_state() fails and in the current sources
> (without this patch) we don't check if it succeeds or not we may not
> have properly working hotplug notifiers =>
> {set,clear}_bit(cpu, pmu_context->in_cpuhp) may not be updated
> correctly.
>
> The if-check logic in cpuidle callback:
>
>         if (test_bit(cpu, pmu_context->in_cpuhp)) {
>                 raw_spin_unlock(&pmu_context->cpupm_lock);
>                 return NOTIFY_BAD;
>         }
>
> relies on that and may not work reliably. As a result c2 idle states
> may stop working or offlined CPU may be put into c2 idle state.
>
> Going further, if register_reboot_notifier() fails and we don't
> check its return value then
>
>         /* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
>         if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
>                 raw_spin_unlock(&pmu_context->cpupm_lock);
>                 return NOTIFY_OK;
>         }
>
> a CPU can be put or at least attempted to be put into c2 idle state.
> That's why there was a question:
>
> >> If c2 idles are used during reboot/shutdown then they fail or what?
>
> If it is fine to use c2 idle states during power off or reboot,
> then why the code blocks them during power off/reboot?
>
> >> I am not saying that patch is correct and some rework is needed but I don't
> >> get why we should completely ignore errors from hotplug states registration
> >> and should not check registration of notifiers. At least warning should be
> >> shown to user that pm functionality might be unreliable.
> >
> > As mentioned above, and in my previous reply, I think your proposed
> > patch is a good idea.
>
> You mentioned, so far as I understood your replies, that _only_
> destroy_cpuhp_and_cpuidle() is useful and setup_cpuhp_and_cpuidle()
> should be non-fatal.

I don't know how you reached that conclusion from my replies, as I
never said either of those things. The only outstanding point for me
in your patch was about calling destroy_cpuhp_and_cpuidle()
unconditionally for platforms that never called
setup_cpuhp_and_cpuidle(). I was expecting either a new version or
some justification as to why that's OK.

Peter
