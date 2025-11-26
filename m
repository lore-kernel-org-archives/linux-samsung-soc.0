Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C331A06A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188841; cv=none; b=bcbcg/nUfD1zrPMh2cnxkDu7qdKGUAcCsifc9iblSFahinwKzexCx1lYcE26jgAnM6WgOT9KR9vvtWQaYyjb9DkhNUmHqQXNXLNMiVlNGk+jW9iHCx2sKLNGzh54/EFQkWdDIz9DKzDuFOcpRttnc/8DoIQQ5TuQ3ee+QfAniCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188841; c=relaxed/simple;
	bh=BUKUk8XbTFbg4rBCIooaYc9015FQ2fbX5halOJx9HyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sETKelIWMgIvphdgmHTb9E6LL/vl8u2mCI+2B9yAj7nG/NT8/6SNYfV5cHjT4bGP65AolffPg72PA6vz87gcA+KRIN17BpI0IcDORAFOhIIS2vdmwuRnEVbx+kZaY9H/Zrj1HSG2m4aQazJLYVjvskFORnkUx4g3dMquS8w8swE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s6AgJ+k+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s6AgJ+k+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297e264528aso1785105ad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764188838; x=1764793638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=s6AgJ+k+S05B8VA8DFZWOL2d5TbrYxk6tma4DHRIF0l5l3jtDLGUrbZxPZmH09adwO
         cg8HXhneoJdVQ2K1tIYT2RJsM0oEkBUC+MNOWOY4XG2pr+GPN1zaR1DiFJ3oSYuoJR6z
         AqdGwjk0rQJs2ePWrolt5B+OIb9egoFhaZ9AZvt647nS5HsTxdmZnYWOoGythSyIDLVS
         1z0F+LDYeOR3wrfXDD5ZHnaA/Ozhn0ojJ/OU3dlzmeQJ+kC5puBYCT8H/H5Qyf5d1fAb
         6MTuupBGvBHCKxHx5eijCK+6sS6rLGq40qfzsdQrrK+lV75TU60t6RJxuJcsBeQUmUOh
         XBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188838; x=1764793638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=HvhEoVGlwRabYl4W/u+VJvEB98QIqzvuatUD1TBG2dMRoRQwpQuwn6K8N/1/IHrnuE
         6Of3N2DWBlVsij4gq8kQO2fYyptSiCALbeoVj3LKji5IGQgD7eY3lPGM7nnKwTAzRWk2
         S6kJbJfETITl451xz+mbGTXkMOal8puZEbFuvkAg4Ufm45PEAR80+a+elCMgdgH0p5b9
         /TJLTXBvjriKFI8cN6RHWwMg02Q0zhiYbRfCm5iIttfkqHc7Ejz7cMhxMWjvklqfo+W6
         oFzY7XdKQ91XD2UsllTITACRUGQkg9n6MkUE5S7ifG6pnRB+YHNv61xpOiFOipyieZCT
         G2kw==
X-Forwarded-Encrypted: i=1; AJvYcCWW34zNsyeS3McSjhvrv8HVcKVquN4ecTgFO85IQQwZDjsMKhibk+dYZscpnUciIbnha4dqp/2hNdcCUt5trQkeyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHyzT//Lf3kdE9O7ZIi20oTxa/HLygHjko7rGtAOkhkF1iWS+
	7MUQJDYfQWfhGNjkeFTkU1PkcXXsveelP5+mfTRxYgXW7qE3lxCA4w0aphtRxs6pig==
X-Gm-Gg: ASbGnct2oyqwSpGuOdc4C3fMMK1a6PbHaLAvQld2RyqlLYRvjLXeQHLWbis+MlRv7Xf
	POP18zmkoi43RSnnemJ6LLJpUEnP2hbGvLJQCGNv4qWtUf5AzV5sK05en3YhI99cV+o5ex/zclt
	qi/jtk3naoRKMARTMuMle6i2Hf2jXulyWG+sG7K1ygCvYuwMddOB/jEF0ElVHaFnNKMo+VdGrM4
	TFxfenEWCJPPBrAlqObsVlbjxL4hEzuXe38P9BoSu+xbQL4LH+EePs0zBlRs8wCcPAIkrmQ+1CK
	9RUgdjRIXEt81xN+v3yQkvIRZ7HsqM4N1HDjC3dMTX9ZbUG6XoCe0lrGf+ms7YFalx1vH2ISnQp
	qhEbWXD+8gwxAXgGpn9OwhGA4gK078cBG6wmslBbiS6oCZgAVFyKiwrF48AR9oszZf0XI9GN7qf
	mKdbkQPEaJR7WTC4olASN3Df65Jgmx+IRNj+jEgpDzuzFfp2HZqWoAPOQIxhndK/ORBqjt/tXst
	5955FUwMpmQNA==
X-Google-Smtp-Source: AGHT+IGs7j+rISQURjI4KHJiRtxo72A6EAIFd8qUy73nZRmTVJ6HUMi3Fk8FYXZXKGlB3rSWFkwohg==
X-Received: by 2002:a17:902:d58c:b0:294:fcae:826 with SMTP id d9443c01a7336-29bab2fa50bmr92368305ad.59.1764188837611;
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm205771575ad.75.2025.11.26.12.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Message-ID: <1be015d7-201b-4e3a-a71a-130162205e5e@google.com>
Date: Wed, 26 Nov 2025 12:27:15 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
 <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 8:18 AM, André Draszik wrote:
> On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
>> Hi Krzysztof,
>>
>> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
>>>> Add a regulator supply property for VBUS when usb is in OTG mode.
>>>>
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> index 3de4dc40b791..a529f18c4918 100644
>>>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> @@ -32,6 +32,9 @@ properties:
>>>>        description:
>>>>          Properties for usb c connector.
>>>>    
>>>> +  otg-vbus-supply:
>>> How is the pin or supply called in the datasheet?
>> The pin that supplies the VBUS power in OTG is referred to as Vchgin in
> I think that should be chgin (without V prefix)

Right, it's just CHGIN. These CHGIN pins source the USB VBUS power in 
OTG mode.

>
>> the datasheet.
> Cheers,
> Andre'
