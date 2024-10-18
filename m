Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19418732A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2024 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729237776; cv=none; b=D1jOSAuiNqhO0NHO0zfRmJvA4L6pPDL3WBz0xSXNu9x8m97SlkEU90mblyQcGRWa5OWtvHz+uudjGUAJtD7qGSujzpCtxwhe5PaZa/GBFMRy8l/4jx3cwBZR50hrwmLrbJDTB1D0ZwI5fsZD6/CKSxi5KOg7BzwhPcFqjGT+NkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729237776; c=relaxed/simple;
	bh=fYFmmsgbDiEiyuRUICJBYPFPcYvmo5MwIRakihQz3WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2Ri58yxvnogCO0RYVBMlCTPMNaccd4wBb15I1Z46a3AoPy+D8LRkS89yefDKvb6jjDRj01uOVGLhoQOe1yiRq97AnOU3pP0PIocXKhMf3HLP0dQa6rb0I+yMp6w1ZUk9wrK6Z0D9PIuFbZhc0DPoUjXU3olBGN0J/baSMCTtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZcaCLHK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZcaCLHK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so1942935a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2024 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729237773; x=1729842573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ty9sh7/3y5gFz5GNITs3Hwg9LkowlZM8ANgENa9Pfco=;
        b=kZcaCLHK8SAwLDRozbTelnnzFm/dxjmEirzU1ZCZmZXKpxTcljZsy5aenbjthhU2i6
         WsuIatJnlEMFxKH45Xnqr8dYJ4vebJCNJGDZrSb39rUaYs0QglmhcUnCRo46P/FRtrLw
         gBhOR0g8En69bmVBaGl4hBIDQPNDb65dX88fujsYjOnPaLJb10yJSJrcYudTnYQhlT5K
         aI14Ht9VCINOlmXkny2TkGB9708vrIxPSk6bLDU7u8m2Lsdo/uB7XaEX4Jng0RL1eAVR
         3UtcmX8sdMrqa5fypvPliu83e1II1QFFKhpfPgKsVv4ywfqzWvWI++VMqazrl/Tz5pm1
         7M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729237773; x=1729842573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ty9sh7/3y5gFz5GNITs3Hwg9LkowlZM8ANgENa9Pfco=;
        b=mdE6XoXyrVnTRNVZhvKAwYpd70Kto0rMGBdZ4s6d7VSmt3ZAPqjhIcJ9NvywtDwLuU
         3RLH7qhR4tmO6vx+hYe+g7LFIxfIpqYqVJ4/d3/3+9MPJ7LvE2/4WUS1e7uQgM5d+G/Y
         B7iF72EYHOBSC+Flh2WRS7Y7DpPhCT4c5UjHXWMRinf5CnXHgTLKJ1OcV7x+NWp2HxGq
         75N56c/DiVInDOd1T+D8VEiaVDLQg8AeS/HCQJrRH/FA4n0t9qGWK0IvvnU0q5K2Ypwg
         TLxSCmY4w2Hz/4Is5u89oaUS7SH8weuKuu4u52t5xck1bBtUhy5n7N0k6wcu7F20tXme
         dLWA==
X-Forwarded-Encrypted: i=1; AJvYcCWDFQSTmgcGgSCfOtF0dl8qmR9+MyrBSoEG0tHP/nusbPxZBjGjHw8C1y0iNXpjQIeQW1r257KyYqzPorFc5HTCGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxutYS3YL7nFGiecuBWTMlt6YvpwJboAL3ZYxvKBr3eY2eUINS8
	RyQS40ssj6YgotCmPyNDsV2uItUi6SlwXCjrkU/+TBTJMjbSn08nQBfFn6cAHtQ=
X-Google-Smtp-Source: AGHT+IG/3iEa6Ihs5SBiyAUaudbK/iy63r0o3DcWT7JdERnKHHOl08J+1RfF0T+/gwnXI9G/S0dZ/g==
X-Received: by 2002:a05:6402:27d1:b0:5c5:b90a:5b78 with SMTP id 4fb4d7f45d1cf-5ca0ac53ce6mr1156975a12.5.1729237772776;
        Fri, 18 Oct 2024 00:49:32 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b0e7130sm380423a12.72.2024.10.18.00.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 00:49:31 -0700 (PDT)
Message-ID: <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org>
Date: Fri, 18 Oct 2024 08:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com,
 javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org>
 <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Jassi,

Thanks for the review!

On 10/18/24 5:17 AM, Jassi Brar wrote:
> On Thu, Oct 17, 2024 at 11:36 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Current form of the mailbox framework doesn't allow controllers to benefit
>> of their hardware queue capabilities as the framework handles a single
>> active request at a time.
>>
>> The active request is considered completed when TX completes. But it seems
>> that TX is not in direct relation with RX,
>>
> Correct, and it is not meant to be.
> You are assuming there is always an RX in response to a TX, which is

Not really. If there's no response expected, clients can set req->rx to
NULL. Then the controllers know that no response is expected and can
complete the request when TX completes.

> not the case. Many platforms just send a message and only need to know
> when it is sent. Many platforms only listen for incoming messages.

these 2 cases are covered with the req approach.

> Many platforms have TX and RX but not as parts of one exchange. In

I don't think I understand this case. Is it related to what you describe
below?

> fact, only minority of platforms expect RX after each TX. Btw, what if

Right, I noticed.

> some platform sends only and always after each receive? For these

This case is covered as well with the req approach. One just needs to
serialize the requests:

ret = mbox_send_request(dc->mbox_chan, req1);
ret = mbox_wait_request(ret, req1->wait);
if (ret)
	return ret;

// req1 completed, send req2
ret = mbox_send_request(dc->mbox_chan, req2);
ret = mbox_wait_request(ret, req2->wait);
if (ret)
	return ret;
	
This shall work regardless if the client expects a response or not. If
no response is expected, but just a TX completion, then the client can
set req->rx = NULL.

> reasons, it is left to the user to tie an incoming RX to some previous
> TX, or not.

It's possible I haven't covered all the cases, but I'm willing to
understand them and come up with a new version with your help, where I
address all the concerns.

Cheers,
ta
