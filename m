Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08F33F5A3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080143; cv=none; b=FyfVKoAYvx6DYzeKdKHSObTYUAp+duvGXLuCRlt7fC7yTPemdd7DODznbYATYSmAgSFOjREbICLrlnxygGUB8bckmgv7nam5ejBkz0NtT8k2fVxvC2AyjV6sZ77ul7sCwEm2qCJcAtNEkN9aBz9Z5YaRbBBxHD6afvbzvYebXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080143; c=relaxed/simple;
	bh=DrnNhO9YiejBPR79fk6YWMRGSRi8LbzEUcT2iDql8qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwqwaRlby5FSHQq3GC+SYbR3EN0R08JQfBWUWvzkS85QCfAXLxagBHe3I28e7cEDPpcDfEBbwLp3s0hLmx7SvnNhwzrK1w1ygKQdhFz6ZDz+kdSFMEH3a1ZP4V/TRsankN7XQVnb0Y0ZBTB3ch0xL8zXUJX7MBdOlNrnVZlJjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OePKG/MM; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OePKG/MM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2be27fa54feso9612420eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Mar 2026 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773080141; x=1773684941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=OePKG/MMbOikwH5zyneGFvjfcjD40RR7QKnWriZajWj8x48zRx+h3lxLCmo3cuWosp
         qHupE10JCtD+AGbHqetBr0kGJgBKLm1eqver1R+NkoGjZIDy5LntWqrSkgGJH9VgR/w1
         FQF9vaz36hVUgaW3TI4R5Hf84NfF6uAToJbvyUeodqEkLcmZUDhdEuIcH/OVegONx0P5
         TBlCXsVH1VHVVe3hrydxE+lEcQjlRE1MdvyCRyKLmiWH0KCt2z7fI5ql7zpk7ehdQGLT
         IQrPEfCt2jCsBCLGl/V9zGNUYNVM7EFxDpr0j/ujwU5qT6U7q8UeRE6suhqnXI/LKA0u
         mkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080141; x=1773684941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=Zsb77BV/1vrvVRolbzlw2hS8kfyGQqEO97STXb7jXno25z2YOqVMUFopVNo9s1DHOI
         lUP6BIYSANRdHG8jMYSv7tDtD3905Dv6QX4esGrgAFUm6euwl61gPtT/GMySvhkD9qs+
         mHFeXP8WJzVGx4vQZXZtxifx6H0ZSXmUTvuThLzhmQxP4zGK4dO/H2otQp+4jMYbXQan
         CGvxlaFUG4PN1wNd5u/IA7XeVTy0CzD3k7GYsH1isYeWBKrus+DIAiij/YcOPa0COuGb
         aavjWn7prUDNTuz+szfmt0ZysXeBtjl21VzwBjCF7hVhq4Eatj0e+JMIm4p+JKnv9ejR
         PpEA==
X-Forwarded-Encrypted: i=1; AJvYcCXoxqiu8lUEQsb+P3kUJBmxKFVb76hKicYKm6TAKbF9DxxjQZtjyIJovCEhHd8pp7Ue6iHtjx84x3zAHpxeKQi5VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8R1YlJESpoBsBP20l+F4NUI9mhI2cpGSRo3iDj+hazkZp/5ry
	aUmRSCMmvknk9qdE2AxDoaiR2v3mXxufWXVu9woxoKzvCCmJ3x+tYVBwTk7sonwrxA==
X-Gm-Gg: ATEYQzxqQKdquKQ3XUW1bvRMmJyHpbtbFvTb8AHK3lcmaQiIuE+3OdVLwsOh8m9hZpG
	jfqZ5re8+kQzj43qNARDwdMJDKKsPpUm+L4LbluKkYJ3ugnE52Rz3zX50E+p1DqXfUwM1ju5sCD
	/uTl03KJSRIPNULzLx8DYb+1uzQnX/aCvmgZfYD6SIosj3ud6cb8ydjoHjDPcTJoXDPEcEJ3lOq
	lCOEKp2NAyPWDZsTkS39bOFE+YHBZPgahz8w0FPezyyzXVU7bXqNR1v+AZHQLZsy3UMQcWMva0E
	TICTs9xFpkHhQyo7ena8b3PDGOuFPRfjLDXfFQh/68NyXrxaBjNyehHQ5OWleAmGvcMdC9zdXcY
	NzOxga0AAiEGozSWKdscdP3+Tx0D7A6BrYbt1yLxdhwSxxlO9pG/vJXuX9OjBwnk1/PeU0LDCzb
	0E5C1yvMqmQusM6yxRrPVGilbStLnfnU66vxdmW1ZBOUF9/GPiDNC8gcsBtMECJu+kgfxHyAyra
	GCfYKcRIuUuKidkHxjB8STbSw==
X-Received: by 2002:a05:7300:6da2:b0:2ba:8018:cc62 with SMTP id 5a478bee46e88-2be4e0abd99mr5228221eec.38.1773080140424;
        Mon, 09 Mar 2026 11:15:40 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:237e:af03:2727:6f8c? ([2a00:79e0:2e7c:8:237e:af03:2727:6f8c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82850fsm12031879eec.9.2026.03.09.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 11:15:39 -0700 (PDT)
Message-ID: <2034abb9-96b3-464f-af5a-d76b561c9b63@google.com>
Date: Mon, 9 Mar 2026 11:15:31 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sebastian,

On 2/23/26 5:45 PM, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>
> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> Li+/LiPoly dual input switch mode charger. While the device can support
> USB & wireless charger inputs, this implementation only supports USB
> input. This implementation supports both buck and boost modes.
>
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>
I hope you're doing well. I am sending a quick ping for this patch I 
emailed for a review :). I wanted to check if you need any further info 
or changes from my side.

Lore link for the patch:

https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Best Regards,

Amit

