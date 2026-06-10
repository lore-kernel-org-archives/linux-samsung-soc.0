Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12440408639
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104076; cv=none; b=NFFHrGprrVAv6XtyHrMbgQpeJCQKgvna95i1Kw2mOzNEO6SujwnzzpbdmY17GHy4whYYV5nVCeT6cGwltL8yjEHgLcBJbBlarvyzjbdWkQNXCwDWMgbB0vS/APGyE/yKHd7ZoVSRD5nxbUMXHGGcBiojM9+xTFwijz8g/iKB0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104076; c=relaxed/simple;
	bh=58f25bTT4YoEtaY+ECpkwpOWUnLt7jdCAYoUReU5Q4E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mR9jBkfaK9TpNOFhlQoT/JV2/q+TCqKiXq2+SJZGtTFVXAZ08DwhA09K8knYbVV4GLwzMD8scCwCJQ+yi91pbBIzXSgiuxGUXTS4dw6301nk2OzcwQXewIzYIC87H0YazrgTxMtESxqldaNrzPfut04l6ZuGO6YJHM+tYHFLFJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luwAhd02; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luwAhd02"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490afc47455so36865645e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781104073; x=1781708873; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FelCh2VDHUplvnJ8mnvXATyOKPI2L/eG8fwTa4ZA6GU=;
        b=luwAhd02DIShXYU+eJ4F+iPcw4Nr28LtCSo/v4r0mIftbgTZcz0CsXyNHBlb1j5X7v
         nSEfzwlAKKwZueWlmjRExEgGObsl6N9s2zzN3FynQZohJSYi2yS0ExoApMOSLFVwb8rB
         B4AKIPRcZ7T4B8hWrJzqhuEiEoI1LE/zwFf79ME5jhrSFCmFjnaEt7tYP1Lid3gXqSJ5
         8XiAPgDVLXJomHbWduh+WkWpQKMwqM8pzU/YfV9Sd5JFytF/OMB0z2dmCb64T2QMujb2
         MyHt4dMwaKA41MNLijyqyv9Gjw8leRNZy3sR50AWeI+hqLzh4a66FWSNaFIZ9GZDy93+
         L2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104073; x=1781708873;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FelCh2VDHUplvnJ8mnvXATyOKPI2L/eG8fwTa4ZA6GU=;
        b=n6lfMqL2NKuyKlZfT6uU+VsYZs0XDv3ucTeumF1dZRrgvtkRTokN7qcXidrriEzq4Y
         BjEZT/IcaeKaXobM/52igd7XvZeVZS9weoM8k4JlNYh/ViriY8sM7XIXmDKy22cHjXds
         OXPWtLLBt6QzfZFT8yegxstNGyeANiC9JxlsasvOUmsaweEDEL29eDS0OeNfUC1p0rhK
         alvMV2ujB7pEP9ex/gIjHI3DVIgYzTveYztC9dJkIx2lRnM+KCCkzAEnp7QHReT3kZMb
         x05kyOAAnjVkSI6+LQ7NXsmXjqGwXdPfW+PdYmBtnG8lqHhppvM7b09K4tSSfNlJH+Gc
         TlEA==
X-Forwarded-Encrypted: i=1; AFNElJ+WesY1TiM/Y9fUsHzxy1mhQ+Tp34qZWVJ2fwBHh9rkejDrBsJ02Bln5esJe9tliWvPCrIxKecKGOidz1lSB9hH1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5djjTiGTf91ngygVGrn/Wy8BxaJbDkcmOm8kXsqQ3R5veMsJy
	s9DaU9T2y3jr20uTJZQ4RgS8U7YijaPACWf/NHEhjHZO60fkhYFWisdK/pTpQkC8yKc=
X-Gm-Gg: Acq92OEIYWOwMec+BanFQo+fmfLnlUeHVWc8ZuY3QQVXm372HFqA2fLY40aZU/2KEaH
	YiAtqfjGx7JMZFcn7zE1mCD1TAZIwoCpGWYZFCRw/yhVLV9C+lksN1XB4RejH8aTS3R1sNZGZnq
	c0AsZTC06MIoDiKVYC9ahdUfykcjVpKDvrMX6iETz8CdDCyK/rzwFlk1+nrc10yUTmxB07anyPz
	PAKGVijXqqqUksQr7HjPmdYkXQyk68KGizSbo0cAfXCe865XEtk06dwWAivtUdQOPCH2SsKsdS3
	ghTahgBWRrTAz2uqCJaZn+z6gAV6AXRe7176S07fOr/EnwCfRWw0bkWrvHd4QIlXFZcqHm6xNCE
	xqgBp9etOJiRAcBhAklB7rENn7T7C1fKDWkD7ESE3pph23BtgXCeUWqiIfYKuFSTPxbvusdoaEi
	jAmTCVz0ZGY3MCOZQNs7cRC/2EXASH4oPlzMAg78otQaGBPsyu3Vb2mT0w3UEV7MmUZpFsEVmei
	Ya9yz1tWszvEpxbhtydqF2W
X-Received: by 2002:a05:600c:8b0c:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490d722a0e9mr93925085e9.24.1781104073271;
        Wed, 10 Jun 2026 08:07:53 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm610037105e9.8.2026.06.10.08.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 08:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 16:07:51 +0100
Message-Id: <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
In-Reply-To: <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>

On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
> Hi Alexey,

Hi Peter,

> Thanks for your patch!
>
> On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wro=
te:
>>
>> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
>> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), an=
d
>> register_reboot_notifier(). If any of these registrations fail during
>> probe() routine, the driver returns 0, leaving the driver partially
>> configured.
>
> I originally made the failure non-fatal because the system still boots
> without the notifiers registered (and all other Arm64 Exynos SoCs
> upstream don't register notifiers and AFAICT have broken cpu hotplug
> and cpu idle).
>
> In hindsight, that seems like a mistake. I think your patch to fully
> unwind everything in case of failure makes more sense.  See small
> comment below about destroy_cpuhp_and_cpuidle()

Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
return any errors?
Why do we need to have notifiers (say cpu_pm_register_notifier())
registered if, for instance, cpuhp_setup_state() fails?

The other thing I didn't get is that this doesn't deal with handling
errors/return values of cpuhp_setup_state() in probe() and there
are still a lot of errors returned from setup_cpuhp_and_cpuidle().


>> Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe(=
)
>> routine, for instance devm_mfd_add_devices(), the probe() lacks an error
>> path and leaves notifiers and cpu hotplug states registered.
>>
>> Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
>> struct, that should be initialised to CPUHP_INVALID by default. Check al=
l
>> return codes in setup_cpuhp_and_cpuidle(), and add an error path to remo=
ve
>> registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
>> helper to safely tear down notifiers and cpu hotplug states.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-=
0-54fec5f65362@linaro.org?part=3D3
>> Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs10=
1")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c | 57 +++++++++++++++++++++++++++++++++=
+------
>>  1 file changed, 49 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index 9636287f6794..846313a28e9a 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -38,6 +38,8 @@ struct exynos_pmu_context {
>>         unsigned long *in_cpuhp;
>>         bool sys_insuspend;
>>         bool sys_inreboot;
>> +       int cpuhp_prepare_state;
>> +       int cpuhp_online_state;
>>  };
>>
>>  void __iomem *pmu_base_addr;
>> @@ -404,6 +406,17 @@ static struct notifier_block exynos_cpupm_reboot_nb=
 =3D {
>>         .notifier_call =3D exynos_cpupm_reboot_notifier,
>>  };
>>
>> +static void destroy_cpuhp_and_cpuidle(void)
>> +{
>> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +       unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +
>> +       if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +       if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +}
>> +
>>  static int setup_cpuhp_and_cpuidle(struct device *dev)
>>  {
>>         struct device_node *intr_gen_node;
>> @@ -465,16 +478,42 @@ static int setup_cpuhp_and_cpuidle(struct device *=
dev)
>>                 gs101_cpuhp_pmu_online(cpu);
>>
>>         /* register CPU hotplug callbacks */
>> -       cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare"=
,
>> -                         gs101_cpuhp_pmu_online, NULL);
>> +       pmu_context->cpuhp_prepare_state =3D CPUHP_INVALID;
>> +       pmu_context->cpuhp_online_state =3D CPUHP_INVALID;
>>
>> -       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
>> -                         NULL, gs101_cpuhp_pmu_offline);
>> +       ret =3D cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:=
prepare",
>> +                               gs101_cpuhp_pmu_online, NULL);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       pmu_context->cpuhp_prepare_state =3D ret;
>> +
>> +       ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:o=
nline",
>> +                               NULL, gs101_cpuhp_pmu_offline);
>> +       if (ret < 0)
>> +               goto clean_cpuhp_states;
>> +
>> +       pmu_context->cpuhp_online_state =3D ret;
>>
>>         /* register CPU PM notifiers for cpuidle */
>> -       cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
>> -       register_reboot_notifier(&exynos_cpupm_reboot_nb);
>> -       return 0;
>> +       ret =3D cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
>> +       if (ret)
>> +               goto clean_cpuhp_states;
>> +
>> +       ret =3D register_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +       if (!ret)
>> +               /* Success */
>> +               return ret;
>> +
>> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +
>> +clean_cpuhp_states:
>> +       if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +       if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +
>> +       return ret;
>>  }
>>
>>  static int exynos_pmu_probe(struct platform_device *pdev)
>> @@ -548,8 +587,10 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
>>
>>         ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pm=
u_devs,
>>                                    ARRAY_SIZE(exynos_pmu_devs), NULL, 0,=
 NULL);
>> -       if (ret)
>> +       if (ret) {
>> +               destroy_cpuhp_and_cpuidle();
>
> You only want to do this if pmu_cpuhp =3D=3D true, as currently only gs10=
1
> registers the notifiers.

Thanks! That's good catch.

Best regards,
Alexey
