Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB381A256C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734077594; cv=none; b=Bvw7so1u7QMLsLhZvXJw1hmjWtO+ZW+mVUBYxrchLX7JPok0eF52p1vCu+8O/t0jQAeOHupIhlsr9ev5Pf5mprzcM/6AFVC1HGz80LLd2QXzztyEwVeS3W7Hqrd5ZqLn9YjAC3gJ/WGmwjkwcufWK75f82a71OX9mCXYP+qrWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734077594; c=relaxed/simple;
	bh=L8+jNle5JOhNM89zVW8yJxWxsKfxalaeG6wDpSPmqMk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mREvZPGALoapmWV+WYBskkMAXtr0IW7K4Voq/z8rpSm75Rw2Un2s+ZQCjRIa0Zz9Z2mDKDkCHK+rab4amTtkSgrPoi/nO/6OypLCA86bbCINTD2akB+fs4yj+eAdePbjXEgkBeNQ7rNwZsvTlf0DBrzo9/2U0V6wmmY3YIthIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0Vnkxhl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0Vnkxhl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so2683418a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734077591; x=1734682391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=;
        b=G0Vnkxhl3ohCH/sf1DOHWJbTbaUDPHVTs5/eb1g/+lPtadMKzBM9PgAwrKenUG6rkj
         g56FLrMnSRyXal49JLnyIMEQY/UAgTeXdIvM0EYJ+tgJSAqmlFe0nK1XKoC9x8+Dtdjh
         MhIA2IRaLl0aVvm6uuJBwzPHHVe+tlYI+9bJaWUpmA7l/+WHnNw1MIA50TlSclK0TZqL
         kil8UqFKZAvzJ04ZNCYIOA/e2MQLdvQlDdJ6DYoceVFZ2yn6RtMPy0kto5MtBOFfoQT+
         2bU0tKqRT1ioMANQJ2IayZCv3W9kle3lmQ727HHJq25kgKqQaOG6zNDTAxzsiNqNr6M8
         Ni6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734077591; x=1734682391;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=;
        b=wwITZZ+o18D0rpr2yEiCXd1cGZtGiYX1gsl+/NGU/nfQu41DhmIWNyZsy819bKYL0g
         QRmlXtL5E5X5rUM1BCWcGosJabvjwEXvpp1+ZNZKrSFxB882qrabpXTdxyvZaXGYe5OG
         OjxPsIFSGvJszGznypfJgRQq2jaSFBmPs86zzxYBxzxMHcmjKKTS+l4EUZtKZUHYxzFz
         gBR9N/QZbj0pn0mLfkn1T+giBWZFo8n/bOjKkNgMXE371GSb+AdarjjsKr/54LeNa/rN
         kRH2Tcoxzqa3PdlthlbgX4BeGRTf0XTsptTyoT121G33mUCJypd71IErVT4fPF99jxZW
         6sEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7wWbY24nPZ4dA3DT5q+WBMRlqT9bMwA67v15MkFm1jeqVJu9gSA7oUjd+WHf49u1dhPzATTgmao/pru3iKdog2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXdmbVK3FCV3q/wnH6Gh++mhp7+a+ExZjmKdCbuchgjBbbT6/
	iTtPTBhqHFe4r74E7qp3+KJpr1zKRejS1LNk0EnIGecMbGrsoiN8oNuAe1vFv/w=
X-Gm-Gg: ASbGnct2G7CrJQfroFoj/ZA2gbRxvRFsbJRnntp+TSqFWpj4reFdaJ3JDZ9VtsC+3gu
	18/zVKW1cHkuO/Rk36yL1V+rW2pbGkOayj6ITDVkShLs2XWDkbn0LomjvLHeAE+7gbPJi43Sj4O
	354zrjDE18T5sK3ukI6WSgxVSrnMjS3n4ZEsw+/RtgSMebBh8idODL6xuF7n7t1wVupsT7o5rLv
	pb50kzSOp6MRS3Rc26VZooH+uUnRojLtaxBvLxmzJDl/etxw9FDePErV3a1tEiu
X-Google-Smtp-Source: AGHT+IEu1OlplbyTKyMNJiSwcJM/aHzieHb5jY3kjHadk0/91d7Jwi8sJXlwCnYq4jjEgabYRNsm0Q==
X-Received: by 2002:a05:6402:40c2:b0:5d2:7199:ad4 with SMTP id 4fb4d7f45d1cf-5d63c2e7f94mr1392853a12.6.1734077591474;
        Fri, 13 Dec 2024 00:13:11 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cbd14892sm9718785a12.39.2024.12.13.00.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:13:10 -0800 (PST)
Message-ID: <467966de-ae91-417f-b315-62459af93b7d@linaro.org>
Date: Fri, 13 Dec 2024 08:13:07 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org,
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, vincent.guittot@linaro.org,
 kernel-team@android.com, arnd@arndb.de, Krzysztof Kozlowski
 <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 ulf.hansson@linaro.org, andre.draszik@linaro.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
 <173402453635.2828943.15564980222849076434.robh@kernel.org>
 <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Content-Language: en-US
In-Reply-To: <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/24 5:53 PM, Tudor Ambarus wrote:
> 
> 
> On 12/12/24 5:28 PM, Rob Herring (Arm) wrote:
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb:
>>  /example-0/soc/mailbox@17610000: failed to match any schema with 
>> compatible: ['google,gs101-acpm-mbox']
> 

It seems I had an outdated dtschema (2023.11) and couldn't see the
error. Updated to dtschema-2024.11 and now I see it.

The takeover is that I shall periodically check for updates, or maybe to
try to upgrade dtschema and dependencies before each test.

> ugh, I remember I fixed this, compatible in the example needs to be
> updated to 'google,gs101-mbox'. I'll send a new version tomorrow.
> 
> Thanks,
> ta
