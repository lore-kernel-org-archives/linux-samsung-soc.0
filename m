Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238941DEE0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206674; cv=none; b=BCF96P1t6VlUHYxCgknpf5k8donn+gq2hPsxOg5vzDrePjuEQZbIwUmvfvh1jkf6RxdxivA27wzyxLdEaN/+7/s6tDCki0L24o7G/roqyTF1boyzH3tLPOmUSKgG5r6j93P22oE40hYKZdhDCFAElLipPxem31sbbTm7NtKGQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206674; c=relaxed/simple;
	bh=ms7AIU8iFFaoa0Ma9a1omLId+z2jTN6MXG5dawWMtgY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=GkibY//LsHFu4g/wDH54KloOCGILcKWEpB15oyzMkGs/5YVMZvWMGkbOtvFYyUmP87uogOh4rj/TFKF4LciJKKEB2VJ7Px994D6NpSv+x0reNMrhox7rTk4zRmvVlA8/ANH4sJTNJSExBGWnH1YYrPu3pSxXcud2ZlwQ2dYxVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jAcAcAuq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jAcAcAuq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476a130c138so3189637f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784206669; x=1784811469; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0LYFgy4yfYQhPuAiPz9CB3wYdVuPpzUCUHrbqHln8gc=;
        b=jAcAcAuqmFZDp2BO+tdEPoUbfhKkQyvzes1jODCJv0PIynlz/YQ97EoaO2J01jCbVf
         PJUOS+8Pn52MdTXPpM5GOVUoj/q+YgHrTocxhbnTWVgsug3sckL8DpG3XvEOKQ5XizvZ
         L2rFYLjAHzk6wXeT9bsIIfpH4+Akwp7AkF5pqfxa04H2Mzmhcd25Z/PWov/J687fU+y6
         6e51yVQrLpLnYXNJxXa8TCa/32lyJej/j/0lq0dvlySvyFWEmAbCTLGVmPof6MGK4hlV
         nJy2v9KXSk7uy2dBY+LubmuF82XoM8L487JuVfEhlRWLkcOF7QM8dPbJG/5cf6Un5ua0
         vaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206669; x=1784811469;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LYFgy4yfYQhPuAiPz9CB3wYdVuPpzUCUHrbqHln8gc=;
        b=dS0MEs2a98uVR3FKfIan69bVf19300tfx0KqNAT/LOfVcxxJnFZi4cQj5DG6iFevM6
         iunwr3G+QJfplK29Jap1GUXPWXT/wbbKSXcR4boQcdTEPL1F3uYgjOtph0AufRkXelq/
         7won4Z1HSgArnxpAK0+bCe3rlJxLoFViFuEG50oTFfkHflvLV7c09kI6/+q3zBm0P401
         zsKf+o2ZK9f4X+15rx23gqlNF5r704klARZMQ+32A/lNLHcpCdAck6ibv/f6p+6VIGVk
         8Owg38UkvWmXfSO8cQZ9mBK9fjyUQysc6eMfnSSXQTDEYu/R7zJyfnZUrZWNuMHDSlGD
         GUqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/G+i7DULPssYUbBVcjG4ULmeZaZ5oiTNodEo7KaGvUsukvxGs3aoM4qn/vpOIkFJ1PQazN7G7CDQ7xOdzyBIKDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27kOTs5qTvXq7bo/m70xCxKIiYF3dIADv85NgaiCj9CtwupMb
	AkS0dV77vPqLqWEMqStQsCOr1nJrT5Cg1pahUqC8Hr2FxJivFvSwshIGsnLf1SPDqHI=
X-Gm-Gg: AfdE7cm1VT15uLXk5ulsllgh3E6ICZVBD3sJcyPKDuoPbqOToSCwyt74E/SUnamXn84
	eMgfrwwllc04Z0HvjFVRD0CEMjZcQAqOdk1SqhhkrtyIsda8BytG4gNlYupVA/Vi7xrtZhn3oam
	SzzP21wDjYcXosMkdmb7eNmTZO9sXR01KwaseKGXdIp3zWSzRvEDOH8kvJFT8sM0zn3dYRAVay6
	hhXID5sr8OHQmugIXv0xb7JU/P6BCsawpPnZxgSykUfjqAbgPwlWvBfDLi8gLd0OuO++qwYau4K
	kn+Nj6RABZDu4h9x3wtqPKY/a+wDKl2hMWSgDynE4sBm+0/kNj8q8NFq2WOoes96KcW+lsWagoB
	x6eiakuIbFi8CwWeip8vYBdXk2/irIPz15yxKUX+uCIca/CUafuJqj3AEiI8vFjUrjvKAHsgpjM
	zkIKswh0lOvoizEtt3KVuf2G+VZgAxrUshnfmZGb71j73UQYyk5UUC84JADZhwngr8Np4D
X-Received: by 2002:a05:6000:1867:b0:473:1ccc:15cc with SMTP id ffacd0b85a97d-47f2da80da8mr24985592f8f.0.1784206669165;
        Thu, 16 Jul 2026 05:57:49 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5e58:c548:d5e9:96bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7e22sm23722294f8f.25.2026.07.16.05.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 13:57:47 +0100
Message-Id: <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com> <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org> <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
In-Reply-To: <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>

Hi Peter,

On Mon Jun 22, 2026 at 9:43 PM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
> [..]
>> >> >
>> >> > I originally made the failure non-fatal because the system still bo=
ots
>> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
>> >> > upstream don't register notifiers and AFAICT have broken cpu hotplu=
g
>> >> > and cpu idle).
>> >> >
>> >> > In hindsight, that seems like a mistake. I think your patch to full=
y
>> >> > unwind everything in case of failure makes more sense.  See small
>> >> > comment below about destroy_cpuhp_and_cpuidle()
>> >>
>> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
>> >> return any errors?
>> >
>> > I suggest you re-read my above comment above ^^
>>
>> Could you please clarify what specifically addresses my question about
>> notifiers?
>
> Sure, I was referring to this part of my previous reply:
>
>> >> > In hindsight, that seems like a mistake. I think your patch to full=
y
>> >> > unwind everything in case of failure makes more sense.
>
> [..]
>>
>> If c2 idles are used during reboot/shutdown then they fail or what?
>
> This followed similar logic to the Samsung downstream kernel drivers.
> I have no extra information about it beyond the downstream kernel
> source. It seemed reasonable though that CPU's will be hotplugged
> during suspend and reboot so you may wish to ignore these.
>
> The proper solution of course is a fully PSCI compliant firmware,
> which doesn't require these side channel hints.

It seems there is some misunderstanding, where we are not getting to the
point. I think I still do not see any comment about failed notifiers
and question about c2 idle states is kinda misdirected.
I also don't see any answers that clarify this from previous emails:

>Why do we need to have notifiers (say cpu_pm_register_notifier())
>registered if, for instance, cpuhp_setup_state() fails?

Let's jump to the details then to move it forward somewhere.

If one of the cpuhp_setup_state() fails and in the current sources
(without this patch) we don't check if it succeeds or not we may not
have properly working hotplug notifiers =3D>
{set,clear}_bit(cpu, pmu_context->in_cpuhp) may not be updated
correctly.

The if-check logic in cpuidle callback:

        if (test_bit(cpu, pmu_context->in_cpuhp)) {
                raw_spin_unlock(&pmu_context->cpupm_lock);
                return NOTIFY_BAD;
        }

relies on that and may not work reliably. As a result c2 idle states
may stop working or offlined CPU may be put into c2 idle state.

Going further, if register_reboot_notifier() fails and we don't
check its return value then

        /* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
        if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
                raw_spin_unlock(&pmu_context->cpupm_lock);
                return NOTIFY_OK;
        }

a CPU can be put or at least attempted to be put into c2 idle state.
That's why there was a question:

>> If c2 idles are used during reboot/shutdown then they fail or what?

If it is fine to use c2 idle states during power off or reboot,
then why the code blocks them during power off/reboot?

>> I am not saying that patch is correct and some rework is needed but I do=
n't
>> get why we should completely ignore errors from hotplug states registrat=
ion
>> and should not check registration of notifiers. At least warning should =
be
>> shown to user that pm functionality might be unreliable.
>
> As mentioned above, and in my previous reply, I think your proposed
> patch is a good idea.

You mentioned, so far as I understood your replies, that _only_
destroy_cpuhp_and_cpuidle() is useful and setup_cpuhp_and_cpuidle()
should be non-fatal. I still think there are some needed error paths for
setup_cpuhp_and_cpuidle() as described above.

Best regards,
Alexey.

