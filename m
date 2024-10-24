Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56474148838
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Oct 2024 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766755; cv=none; b=VFPi4JOyAMQKWxobZ3ba0RqXDGa9so2ng513VBl9l7X/0/qL/MR0ulRal1COcEQirWnFXXQd5OTqzZzjFAqKDLOgDfmA8gDVNEuUVn+xG5BYVnvU93kybIg7NwMufdtmQMrAW1j2VLYT35CE6s+adIbGaUoEpzzNDbaueksHINM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766755; c=relaxed/simple;
	bh=4VAJO1HJmh3HPVAZkFZwaBb2DM8ZaOk3at5jpTDC574=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juDIbiehV9hfBl9QkqZGf1x006mnuPnJCx81BD/kUhHejFrBzUFtchR430vcQ2op+4nRp4AWnMxApK4MAxvxwJ9lQn5OLCfhABiaQSGblxsbjpl4Ng3h7MeVzsufcAd/rlSnj7InGQc5PLGZijULH4ol3mwqwm/IY6DK7MplAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWYP2kCJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWYP2kCJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7aa086b077so89455666b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Oct 2024 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729766751; x=1730371551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paV89RvxdsC2HVqjH1FMUpyp7lHhnrvot2ef/7eVtiw=;
        b=DWYP2kCJlU4amNWNPc3IBJGWDCdB6QU/uHL8walAbZn8t8xhSwPLJfobFpuOVE1T4u
         Pm2/L7/UBWp6oqFvIKw3QALe8ugxOh/X+4a7KZ54h3N4Hhkz33ZPJfd6be8C309bNjj9
         GgRt0vUTc7snkgNWLYyhabMjvyQgprDbbSTuzia6F06xdI1mT1QJyFw6HIAqbO9RvAGX
         0EXDp/BYvgQqLjsS8tAQs99S7KmQRG6lV7Un374VPgwB6z2xry2124kUUhITgaGZY97a
         xrWPueVw6Lc8dJ9ZT1c9uLqL8tJgORjFHXgn4lZLneq+QJhWHfvrGJtQKHtBVrBXKPln
         DBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766751; x=1730371551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paV89RvxdsC2HVqjH1FMUpyp7lHhnrvot2ef/7eVtiw=;
        b=Q3MiNisuHdpramjXkSbHG2y85Rsgv5Ipi41ZxU52gK2hhBGZYq58W63YFth6yXw/j0
         hEhVfT0/l8kQvfJ7S19/i/08NVFjHw2NsOWxbQPpcv5GVX+6y2swqRGkuds+s3iPaqyo
         nFbFlSLKVhtWDI0BFzdITdcim7DaQ0QbaQsnicbhvxjRGnIDF+/6M1hY5FRJHCLaZtog
         nNcDj8v8A4YcPW9lAq331BKnBsRnIb53vuynEXDUWtqSEsfFt6oXz3Au8Df5BDeNSSX3
         gT+l2avoxq6Y9sd1TbqCdL62eX5zGQgy8RUvUn5N1WJeddqzKHeeQoFqa8ck2F8203g8
         KdHA==
X-Forwarded-Encrypted: i=1; AJvYcCV5eiPVpwq7bA8JYyoIpPMfS6od5vqdjJAp3dTnC8aGZV65HX3r/8TuervFoOpb9memaO7qDOw8nWFAbfdUQwgpKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyemxrk/iMCaudQTsSy2+g5TNuBUtd5+mQnK48W7dwJjAxydTlz
	dvUeCXzz3mQ0lWiWVTMHqtwhj5aweD9ZyYFoXMNIGkEAejwbm1/YoJkpY6NOjOk=
X-Google-Smtp-Source: AGHT+IHpyMKEbievVC/pWQ5zz9JH+qLFmDjSkNqofQg2esfN+uFZv9ZvGJ1cy2jkeWMeNyVTRyRiMA==
X-Received: by 2002:a17:907:960b:b0:a9a:e2b:170a with SMTP id a640c23a62f3a-a9abf52b269mr553713966b.0.1729766751358;
        Thu, 24 Oct 2024 03:45:51 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.110.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559be8sm609419966b.140.2024.10.24.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:45:50 -0700 (PDT)
Message-ID: <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
Date: Thu, 24 Oct 2024 11:45:47 +0100
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
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org>
 <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
 <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
 <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/24/24 2:27 AM, Jassi Brar wrote:
> Hi Tudor,
> 

Hi, Jassi!

I appreciate that you respond quickly on my emails, thanks!

> On Tue, Oct 22, 2024 at 8:27 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Jassi,
>>
>> On 10/21/24 5:32 PM, Jassi Brar wrote:
>>>> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
>>>
>>>> The active request is considered completed when TX completes. But it seems
>>>> that TX is not in direct relation with RX,
>>>
>>> TX and RX are assumed independent operations (which they are).
>>> TX is sending a message/request to the remote successfully. 'Success'
>>> can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
>>> ACK}.
>>> You seem to assume it should always be an ACK where we receive an
>>> acknowledgment/response packet, which is not the case.
>>
>> My controller driver indeed ties TX to RX and considers the request
>> completed when the RX completes.
>>
> Does your controller require RX or the protocol? I suspect the latter.

The response from remote always happens for the acpm protocol. Same for
the plain (no acpm or SRAM involved) mailbox controller that I see in
downstream.

While the response from remote always happens, the RX data is optional.
Clients can choose whether they want the data from the RX ring or not
(see `struct exynos_acpm_rx_data`).

For each message that is sent on the TX ring, it is expected that the
remote consumes it. The remote gets the message from the TX queue,
advances the rear index of the TX ring, processes the request, writes
the response message (if any) on the linux RX ring and advances the
front index of the linux RX ring.

> Anyway, the former is also supported by TXDONE_BY_ACK already.

If we want to focus on when TX is done and really be strict about it,
then for my case TX can be considered done when the remote consumes it.
I need to poll and check when the linux TX ring rear index is moved by
the remote. Other option is to poll the IRQ status register of the
remote to see when the request was consumed. So maybe TXDONE_BY_POLL is
more accurate?
TX can also be considered done after what we write to TX ring hits the
endpoint-SRAM, thus neither of these flags needed.

As a side nodeto IRQs, the acpm protocol allows channels to work either
in polling or in IRQ mode. I expect in the future we'll need to specify
the done method per channel and not per controller. IRQs are not used in
the downstream, thus I didn't touch them in this proposal.

> 
>>>
>>>> Is there a specific driver that I can look at in order to understand the
>>>> case where RX is not tied to TX?
>>>
>>>  Many...
>>>  * The remote end owns sensors and can asynchronously send, say
>>> thermal, notifications to Linux.
>>>  * On some platform the RX may be asynchronous, that is sent later
>>> with some identifying tag of the past TX.
>>>  * Just reverse the roles of local and remote - remote sends us a
>>> request (RX for us) and we are supposed to send a response (TX).
>>
>> I was hoping for a name of a driver, but I guess I can find them out
>> eventually.
>>
> Do these usecases seem impossible to you? Many users are not upstream

They seem fine, I just wanted to see the implementation and decide
whether the request approach can be applied to them or not. I think it can.

> that we care
> about as long as we are not making some corrective change.>
> 
>>>
>>>> Also, if you think there's a better way to enable controllers to manage
>>>> their hardware queues, please say.
>>>>
>>> Tying RX to TX has nothing to do with hardware queues. There can be a
>>
>> Right, I agree.
>>
>>> hardware queue and the protocol can still be
>>> "local-to-remote-broadcast".
>>>
>>> While I don't think we need the "Rx is in relation to some past Tx"
>>> api, I am open to ideas to better utilize h/w queues.
>>>
>>> The h/w TX queue/fifo may hold, say, 8 messages while the controller
>>> transmits them to the remote. Currently it is implemented by
>>> .last_tx_done() returning true as long as fifo is not full.
>>> The other option, to have more than one TX in-flight, only complicates
>>> the mailbox api without fetching any real benefits because the
>>> protocol would still need to handle cases like Tx was successful but
>>> the remote rejected the request or the Rx failed on the h/w fifo
>>> (there could be rx-fifo too, right). Is where I am at right now.
>>>
>> No worries, I'm confident we'll reach a conclusion.
>>
>> It's true I implemented just my use case, but that doesn't mean that the
>> "request" approach can't be extended for current users.
>>
> Sorry, I am not sure we should make the api dance around your usecase.

No worries, it's fine to disagree.

> If your usecase is not currently handled, please let me know. We can
> discuss that.

It's not handled. I have a list of requirements I have to fulfill which
are not covered by the mailbox core:

1/ allow multiple TX in-flight. We need to let the controller handle its
hardware queue, otherwise the hardware queue has no sense at all.
2/ allow to tie a TX to a RX. I need to know to what TX the response
corresponds to.
3/ allow multiple clients to the same channel. ACPM allows this. Support
would have come as an extra patch.
4/ allow polling and IRQ channels for the same mailbox controller (not
urgent).

I guess that we agree that in order to allow multiple TX in-flight we
need a completion struct per message/request and not per channel. But we
disagree on the ability to tie a TX to a RX.

How can I move forward with this? No better options come to mind right
now. Shall I take the apple approach and move everything to drivers/soc?
If any of you has another idea, shoot.

Thanks,
ta
