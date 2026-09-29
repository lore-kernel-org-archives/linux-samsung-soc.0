Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32854F93BD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726074; cv=none; b=PzI15ozT7vvw3SzX+tLqN9ygKSuNltTVotFJUZukNSERKtQFK/E1h2HiZIohQiUuU874yAGDrx2LN9q+XgIfqpAEHO0yCv2GHsFVt1/JL7TFmN+T/nPAbctRIFNcRTxMr+F6nbeDWvg8OELyFuI0xZmkxN0aqTWlttbZXRIzqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726074; c=relaxed/simple;
	bh=chwdOE8qd1fjsktwegfYdNwCdSb2Xug6heoW9prIwHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qfEx5b45J8/kK80uyeOJIsv4O5aBNenrFyJ8AeSvRrjlWW9hysKQhDehFilR8SX2PpQrm0m/a/3LLTwnAdoJcwxhyMJ3cW0iWxssU6T7Gp2WsKS0DGqi7moGR0Lt/4pzjqwjo0n7yV3I9QC0fJrp9rKzl90SNEDtRjr35e/kH7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRaSwvTo; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRaSwvTo"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so2584484f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 16:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790726071; x=1791330871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J42GTqlEQ125xUGDakZWJHRN1MJ9s09iVMsl0+Q4Mko=;
        b=VRaSwvToydKQgYAiXnot5Vz1+2RCwEVHX0hzBYTzJUG2LNEnzX5bJorfCnuI+K2wn+
         U1R50zP735zJgvp/B7yJhPQkmNez6YKXF3zdb8v7Ym52XfNmvno9sLfff4KUbO985RaT
         DkMJOsMkIzu+U0jq8Hw+t46rpsrSCS7BmZqcQH0SyQuaRgXKWEjiQ7pXnLRB791ZJJEr
         5uZESZq9QrojCs0oNgFhhkiK0zkrV/isn0Wxus851DHIJojMNMB1n1EXHJ2cs06frXXp
         UhzdInJqlYOeC5V7IfA7NQSk87MkVmFLsXed9ECd/Mtg/b2+iVdOWYM1ZNBJadx7vjjs
         N+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790726071; x=1791330871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J42GTqlEQ125xUGDakZWJHRN1MJ9s09iVMsl0+Q4Mko=;
        b=PK7jPX3F+m0rL03twYhP1E8pHKNfjNr3sdkh6Qf6PMlAg6qJ1Zd0KFgFL+dHOjqWQ2
         b/q3L9WgC8YyDpRs1GuZOZA+mPmItN7TWhJYumd69cPY/+VIob4N7NFMbwxJD4JyYllO
         YmOO5MAMvt8ZLqxzXv+NxA7Aw4jRQdSZQ0GiLYxi5Ms4Ds5Qdoc+cbnU9jBDB0SktJE/
         pLrb9NIpti/0reAxF00VLIxSx7MLZvGjtWa1x5q3xJMG8U1icjYP5X0n8NCB717iitdS
         73Eglx10vffwg3lo2DV4epJntW4z3uxxysC4Ga2PucxNTDD+L4BE4qCUHEX4G1q29YX5
         gEgA==
X-Forwarded-Encrypted: i=1; AKwUvBxk09yc6QNrFyPXWqVkPsxBKzybOrOyfLcJUh0rz2BiRCQn1cvbmsST2mcJg2xrrAQKbjDoV/Z3U+aH82xyuJvn1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZy4PRJ6M8AtM6gaIhKlYN1BqGRYF62NzQIktj2QmUK4tOq+TG
	+OBwrwi1MSFtSXFChDUnWKrCn9WQSXCBtlERsQi6EG29ETIaPr3IPl2w0Aq9t8RZbGs=
X-Gm-Gg: AYBFou13bH9lIxmTpiJshhWX3JEqqRozhyiczrACPpTFTockLb3hnoiRImC0J3w+CYV
	EBSNommqNFXVZ7w/wiDo+jbosTrOcQ+3gQrO4AOWTupstPiCytpnqbvARqXm+fy2D70g/Xw3y0q
	jF0PEf33WcGD4o06VWMfrjfH6E0Ey/WlzhHCwVcmtolv0w4IK/6pY7MGzHYZ6bmNc6yeuRsxPsG
	Gi6p+MgSvYG794FENR8rvGihiYyrW4bbJJzjfkj0tUpLBYrWgAgxwSdGq7MsQO/WRRF9cm/qScp
	kdkfx0K66yNuDRKjqhB5hCvZNAsP2PRlNqbzr+VIcbpJ/fL8ciMuvPrcUkhDqoOcyYSgsUDsVCt
	ychg3ViCwMq3bfxyU945NBDk/vgPQtWfE7pxx0tEoBb5MiUDBu3dOn4J2jjteGPrEC3U0OWBzmX
	GPPrzb2yLajKX3HjECZEL8552wqUNyWTzdy5iGkrH0z4F0+DN5KZMBp5sbA5LRlaBwfO2O3mZzS
	v9l3vFPU+2xow9AuDYA+IL/aiwj/pfeQrCR3Bpa2gEsH7g9sBimIjcYwtG27wIyTr2CTg==
X-Received: by 2002:adf:e00b:0:10b0:48a:efc9:a076 with SMTP id ffacd0b85a97d-48afe9c39f1mr969364f8f.49.1790726070845;
        Tue, 29 Sep 2026 16:54:30 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6c1260sm2324232f8f.33.2026.09.29.16.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 16:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 00:54:29 +0100
Message-Id: <DLS7EVJTZBPK.1C862CKBRDBV@linaro.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org> <20260828-exynos-pmu-cpuhp-idle-fixes-v2-2-06bce6107bd6@linaro.org> <dbdfebba-aa6b-4ea9-b4d6-5e0ef63d8716@kernel.org>
In-Reply-To: <dbdfebba-aa6b-4ea9-b4d6-5e0ef63d8716@kernel.org>

On Mon Sep 7, 2026 at 11:09 AM BST, Krzysztof Kozlowski wrote:
> On 28/08/2026 07:36, Alexey Klimov wrote:
>>  void __iomem *pmu_base_addr;
>> @@ -407,6 +409,17 @@ static struct notifier_block exynos_cpupm_reboot_nb=
 =3D {
>>  	.notifier_call =3D exynos_cpupm_reboot_notifier,
>>  };
>> =20
>> +static void destroy_cpuhp_and_cpuidle(void)
>> +{
>> +	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +
>> +	if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +	if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +		cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +}
>
> cleanup follows the setup usually, so this function should be after
> setup_cpuhp_and_cpuidle().

Thanks. I sent new version where this is updated.

>> +
>>  static int setup_cpuhp_and_cpuidle(struct device *dev)
>>  {
>>  	struct device_node *intr_gen_node __free(device_node) =3D
>> @@ -458,16 +471,46 @@ static int setup_cpuhp_and_cpuidle(struct device *=
dev)
>>  		gs101_cpuhp_pmu_online(cpu);
>> =20
>>  	/* register CPU hotplug callbacks */
>> -	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
>> -			  gs101_cpuhp_pmu_online, NULL);
>> +	pmu_context->cpuhp_prepare_state =3D CPUHP_INVALID;
>> +	pmu_context->cpuhp_online_state =3D CPUHP_INVALID;
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepar=
e",
>> +				gs101_cpuhp_pmu_online, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	pmu_context->cpuhp_prepare_state =3D ret;
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online"=
,
>> +				NULL, gs101_cpuhp_pmu_offline);
>> +	if (ret < 0)
>> +		goto clean_cpuhp_states;
>
> You have only one state to clean here, no? Error paths must be specific
> - clean only what's needed, not a catch-all with if-checks.

Heh, I thought it will more readable that way. Yes, one state.
I reworked this error path in new version v3 that I sent.

Thanks,
Alexey
