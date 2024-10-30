Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE41E260D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291788; cv=none; b=ppyY8rPHLGyjAJZ8XD331IArntWg2ct7qAyItrihGfOYsig3Zbntkr0kU7f8KY2pvWZ9EpWRf9VBIZkUDc/cfMMfD1ZvQHJLu2u4iZKD3ZWne/eMLW5FORfWlrGWG5B2HDSdP4sXIzAyDzPkTIsWPvbDGyjAPQSzEnWG6lx47LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291788; c=relaxed/simple;
	bh=1KULsa+6j+6JCRwXetM56Lo0Zn1gw65F9feRGJpZAlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I13eS86acWI/Uj/E9XL3OiV9/VKvNu85IRmcQRZRiVxWlXDsTK7vDjkhLx6UAjpfoYAusj5edkPYFOqvwiuadk0Ooy56VY77lQSNH3J2Y29c3ZfkMc+2AuG5id3gEjwL9j8SXk4mb53ii3ftJzPaiNoGgRfXymuKygK6KTNKI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFRe41tY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFRe41tY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d8901cb98so570159f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730291784; x=1730896584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dz8ORMovlm8PCaRFyxkHztKoIVxbuXiuAHwjiXhbYNM=;
        b=GFRe41tYh0/0RJ4DTtspjGPX7JYeR2XtAqYQQURty/da+ccLsHqsTsEkFG4M6C8e06
         HBsoK0KL2Fl6s42bnC9iXFlUgezE2/S65fXHTmdJmaWzfFHNeqXZCnqYBX6nwmF8en0z
         9UkFYKz+rndqyUQEfhKpqVDo8PnWTUKmKxwwtjlOqtaO9TGIRd/xWpw90KXgfpnxceuZ
         rt1KuDE3nZB6Q4Ua7C94dJaNNHOuiB5oaO32roeUuwGrw+u5kQy0zVaBeZbUe6VP/MNs
         dAyzrkrQpPO5VBnKULe8r9qnab267CzmtIKXht0joYDIUNdXK0/+DKAK0aEHLmV1Vgb0
         32Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291784; x=1730896584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz8ORMovlm8PCaRFyxkHztKoIVxbuXiuAHwjiXhbYNM=;
        b=TJJ4XM1DE3PcpKdtf7IlCSlRw8JYaTHYbPWuoDGxRjbC7o9yQr3xj/lqVhfuiEpoMo
         y/6utmD0TWC2R1Z7MBCjqPveFFL8Sw2MAMz5Yqd4VavKOKHmPVjakWq9bpcQrjQb+pm0
         iU4a4/gCG3KEd57KtJSgCVKkyoEzvT8lUVc/elBLWP+8gT2aLupsAqKqjN7S/nYXy47J
         UhybWofqgtdAvUX4peqn3pfcYZ6LYRXGAsAb//s59MgNWDDrdUWuMDfp+A7G2hLy5Zro
         2KoHzsGRWH2dcQ34Tvp9RZwu1ph23Zcc89ToH8CsZINZfwK8yW8RFFnmJhh+vDaH3jav
         BGgw==
X-Forwarded-Encrypted: i=1; AJvYcCUL9dgO8enbMkTdXzq/RdElZkpsE7fXbZTD7FfHLxRdWZQl7MaeeKdjQA9xj4NI3A4JbCemKheheCJrdME1aKyOuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+fM+Wt0z8YWbo7LoQG1Pg/jVjDhVoLfz3cblWSjrLMy8FqKF
	nICKi4A36OGoLY1xswb9zllFhgx2F3tv3QAU84Skf5Bl+mSbtfDSVHTirjK9s9o=
X-Google-Smtp-Source: AGHT+IH4FRnmdK9aLuDppBh7wG3Y7nEnBh681TyLIF03sNmMciY0XgRonlSoema7XbLW/dKKGVBRtA==
X-Received: by 2002:a05:6000:504:b0:37c:fbb7:5082 with SMTP id ffacd0b85a97d-3817d649f89mr4690368f8f.25.1730291784286;
        Wed, 30 Oct 2024 05:36:24 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47952sm15159285f8f.48.2024.10.30.05.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:36:23 -0700 (PDT)
Message-ID: <8dfeb9bf-3326-4d04-8dfb-fea9dad85864@linaro.org>
Date: Wed, 30 Oct 2024 12:36:21 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] scsi: ufs: exynos: enable write line unique
 transactions on gs101
To: Peter Griffin <peter.griffin@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org,
 krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-9-peter.griffin@linaro.org>
 <436b02c6-a262-4015-92e3-454d444e877f@linaro.org>
 <CADrjBPoq2jbrMC7wBrjGxMwQ1ebTtBNRQzQ7NfE9=Gw9_4LQ6A@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CADrjBPoq2jbrMC7wBrjGxMwQ1ebTtBNRQzQ7NfE9=Gw9_4LQ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/24 11:32 AM, Peter Griffin wrote:
>>> Previously just AXIDMA_RWDATA_BURST_LEN[3:0] field was set to 8.
>> where was this set?
> It is set to 0xf in exynos_ufs_post_link() function, see the following line
> hci_writel(ufs, 0xf, HCI_AXIDMA_RWDATA_BURST_LEN);
> 
> As all other SoCs expect the current value, I've left that assignment
> in the common function, and we update it in the  gs101_ufs_post_link()
> specific hook.
> 
oh yes, as a driver quirk.
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
