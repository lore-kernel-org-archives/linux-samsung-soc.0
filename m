Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C74CA787
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769299; cv=none; b=E4/J2nS3PF754iPuAywo6+bB4SxctenLOP1JQ+xb7mHTY7IKVdC2eVR6Zurs2Kf0BNx+pbki6w7OWqX7pZoy7Hqg5jZE6BcQxgpvkuF28ERwtyxF+vDlj06AiNudJc/fFeNtj4iUEuCcYcq65tJq9Yn6BPCNHbvFYJxtf2or8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769299; c=relaxed/simple;
	bh=kq5W5nIu5PLv0CsnhiAfj/Rik2O1CWjzqKYPXqcV1qk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=GDhS1NRHXw/elOdTkmQR97usWs31A9Uzla9juf6wonGbZ4FQKewhqw91LdKSqnfMUmZ72zV6dZQAVQZtvcTWya/d5YoZVifDhLoI3rOv87rgFZ+5KEb/xJhGI8rgs2XPS6CfIwd/K20E92Wde8bdVmck8SEQs5qoYxZmFew2mCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN29opNM; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN29opNM"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6abe19c4262so5095221a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790769295; x=1791374095; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=pN29opNMxSwQgnLw0POUd1TLywrUAkSo/Cobmj7smnNGNuoxsmw3jqUG5tQNc0Tk43
         oy2wfQAFgdBJmuZrY0HDHK/axqxtmWPeenPBkqt8MmnmPLGE6Ew7VDQxmbXrEIdjTUCK
         jorF0Y7FddHtH+SiVliSDJAKZ4wXT8syDRkHtRkxLjReHu9n78gXgpaKPw5IKmBZ8pZO
         V7jeXGgQZYKjtrJG1L1ZwgindFmwieHe01qFQT8i2LsUTCG+wvk4zogXwjOlEj8Aa4qM
         q+SJFUMYhpQGdCDOQxmRIpWQ1FbMmyQXD1ihw7Hseaq0EIjb+L+VQDcyUcOPD6x+jIre
         4hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769295; x=1791374095;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=Ia5AeThQHghCoVYk1o5FGj6mpxXusatt7NSJjH1lopcJ75eVQfQJE3RTjlWPppkDFF
         XkG2UVoGW95v53uLmT5l1qPVa5yrAag6qQ48gWZTp3f1KxIyk62vmM0wjSir39R+xMia
         tBWQ7x7lwLr0OXKAFfb+n7IFmLjoS1EuPbCeKrfLd6STE1RCLMlJSLMFlbNx9dM/zwNW
         7FWfivIJXZ7h1xN9d0kaeR1FG9piPSZ7PNaWl8n+p294hqdlf/Sj/HY/XW6x4z1tsdJW
         UX8CPrks62k42MyPJHmmyD6OuiqHJlh+XlvAAsOg7pR4VMQJJRwAt5P4T3jHiryNPZO3
         z1WQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2XEeg8bOLASf5RxQPAr8tNoqb5sMYJcJACi7tm4K+Us85tsxaKS1RsTe1OJfkeHVaTruRI+zewl/Gl3zsFIRz4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIFWXDbzMu5wLUKZmafD+/hQnNxhKOfQPtWe8AWL9dH+G6IlzH
	vZBC1blcnv1Y+sngsKaSIUpTWiouCK9EWWzmw7/rH/u95at/cYsG+SxwVqKiL+e99w0=
X-Gm-Gg: AYBFou2ymZjFuYiX1aZI9OmnMrslqDIV9xkzkR7bSpG40ESjK/rBXyLM4bfiA/4mkrf
	Xi9U1fXOw1Fq5J7BTlmdQbK4XM9wkjnUxafZGq8fs+QiB6dDHPEF9fY79FMdUK3FhFRX/IjPkyK
	qx4Bv9LPF5QFWixMkVpwZ5GkRM6y2ptJuYDOxpOodtWye+zXCh4OGZxnshCc46/llWA220I2mXs
	jn0meqrUs+7iPxF7c+3dOD1d7MbbnM3hdhgCiRqamvPwswDurQ0K/R0Rfn2CllIXLCMsR6M+omD
	3KZJoy7Dk+2MeL4ZLb9c5RZ1taPcS6QjUtMO5TxLCW6HpiReIFN+ieV/e9UQn8YoAujakjdnKkO
	XBHb3+5k42GWwGXzldJBO6rjqLkz0SjJLdYUaUCYwbJc/4mxvuu44urhz+aPOMuIyb7q3ujMgAg
	r6gDbqFADtT7RqlrwRbVr83eMkO+VAxPvdquz7bK1qPWP6iElivH7ySlsvPrS0UMNsR6kxRLqQr
	OlwjI+ZH1/QkdvWkTj7V892B4GdrDjYK122GDPRMi5U9l58B+BGEPcrQwD+67lO
X-Received: by 2002:a17:907:2d8e:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2e23d94b26mr97396666b.35.1790769294780;
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:2655:b567:7e10:e7eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22e16137sm55259666b.9.2026.09.30.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:54:53 +0100
Message-Id: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
In-Reply-To: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>

Hi Tudor,

On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>> protocol provides interface for all client drivers to actually use
>> features exposed by the APM co-processor.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 8a4771899a8e..91c6cee8f483 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -11,6 +11,7 @@
>>   */
>> =20
>>  #include <dt-bindings/clock/exynos850.h>
>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>> =20
>> @@ -170,6 +171,18 @@ timer: timer {
>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>> =20
>> +	firmware {
>> +		acpm_ipc: power-management {
>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>> +			mboxes =3D <&ap2apm_mailbox>;
>> +			shmem =3D <&apm_sram>;
>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>
> Why do you describe these clocks?

>> +			clock-names =3D "cpucl0", "cpucl1";

To link these clocks with ACPM clocks from this list:
(file drivers/clk/samsung/clk-acpm.c)

static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
	ACPM_CLK("mif"),
	ACPM_CLK("int"),
	ACPM_CLK("cpucl0"),
	ACPM_CLK("cpucl1"),
	ACPM_CLK("g3d"),
	ACPM_CLK("aud"),
	ACPM_CLK("cam"),
	ACPM_CLK("disp"),
	ACPM_CLK("cp"),
};

Eventually to have some sensible/working ->recalc_rate() for ACPM
cpucl{0,1} clocks.

Which is needed, for instance, for cpufreq_dt because it registers with:

static struct cpufreq_driver dt_cpufreq_driver =3D {
        .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
                 CPUFREQ_IS_COOLING_DEV,

Don't know if it answers the question (if I understood it correctly)?

Best regards,
Alexey
