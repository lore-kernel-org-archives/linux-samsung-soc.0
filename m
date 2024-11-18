Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0619E998
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731943327; cv=none; b=bhqoiEvUrUWahWlyJBe7FU86WpUem/QWEnVAb/Q8yWTrS+mtI4ejRVi6OOX4Xed8KVng0rpLVSoYw9FKbNzLtMzIRWy7EO50VFX9K7bB/9EEKWmD/lSQIN8PbriZyk45hMDhB0elfbvA9RtAfXM1azDqbc8VMIXKKM5Eh6Gf2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731943327; c=relaxed/simple;
	bh=jn5XT3hwcJVDiUuJsC/BYq6tWkmdqvb3lDZ1dl8ivUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwjRsARMflsH4owq95Al563J2NppEmtqBn/fyYpXumMHHAI9w2zyi27M+V3RjaihV6NjmBcofiZWia1wNyH2yEjv/IumyyRFiHKRPZF4BV0Zy1rup+6bpCfNU9g7ZHkszTWkMm+RyAulIqQR0Ye30XJJ/2KYsSZsmsNdpASUt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKUnbotV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKUnbotV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3822b77da55so1641250f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731943324; x=1732548124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yS/g2Uu8h88uKdC3kSKMEY90IlJiDjaSvhZlfRQ3+U8=;
        b=zKUnbotVDS6JOrWURjZxpf86UHiOuWgrOLT9lyAoaO2gxJAmGkYTYl7jNK+abkMwiO
         9Fzg/PigzURuTp/OGG9pudkulbQ5KhElgjKLjk1j+v1MBOWxuFwiXi11OjACb24PlEsu
         eAOIk+Y8ySa/BMyArJ5yVXBo8nbGmjhkmrKWN+p70xP6JcnmI+bYVEcYNjTjJemmWgys
         LfPqIQQSjQziYy7N+mw+puWP/7+0WHuZCUNDh/sS0EoPSGbrlA9rngbDDlJmNbvgCioO
         vXknR7mVSZYRgxcwNIsIwrcHPnEPnaF1EubH8LFB6r0VW8PgwUebXv4DUdYBjrq7Mguu
         npJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731943324; x=1732548124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS/g2Uu8h88uKdC3kSKMEY90IlJiDjaSvhZlfRQ3+U8=;
        b=nzJ670xAte1PY12LT2e7dt3118iN+MkYtvsiHAPsY4KLn4+9k5D1M2GFUKQGAb7nG/
         BzMoyL49egWi+SGafD7viC1ATR4Igp9Qdkz5PMVfXBlHQJLdletDbkrfIbagYImLkn9/
         RvgTHY4b2zIOfE67zUPXxDNrL6BVo6uPDfJZFT3Iy4qfAaPnjk4Myd1dehfF+ATAc6yn
         sG54hMmVAyrX0wcEJAfYl1TeWjJ1NNCS/FFxO4yCUWQME049qrrnzvOXSjn+B/qwvxyV
         uHdXw+Gh6z3UP08iA9mXnySTeRMmZrQq5D3HAoPaVLcsxKiYhGe3yzQotv0VpEdyVQUM
         V0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ONmXYpj0RTbpMFUR6F/gOUaqavMeXab/PGVa/3jNJ+JUYYRY8SrudCwRrE8YvJ+0ziQFd5vBEq9gg0mfJYAxrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN35WTQGK6TwTPUAjmO3JpuA+JyInZsVqsJ7SDmmhEQRbjk+W4
	1Y3S8IeAlKESz9JxQ4oIGh2oKHtEPz3p3btAofy8+0hpvMj389JiCFqZo0miicY=
X-Google-Smtp-Source: AGHT+IF5i912SxZj9aROjXMiBc6XZF1g7Bx1Z3E6lXHo6tsdVujyqT7a1uumivdREl9IH5QQ7U8UBQ==
X-Received: by 2002:a05:6000:69a:b0:382:2386:ceaf with SMTP id ffacd0b85a97d-38224fd034amr12681351f8f.27.1731943324150;
        Mon, 18 Nov 2024 07:22:04 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382308532cbsm9147678f8f.88.2024.11.18.07.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 07:22:03 -0800 (PST)
Message-ID: <603407a6-93c7-4d45-b171-7bbc871a3569@linaro.org>
Date: Mon, 18 Nov 2024 15:22:01 +0000
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
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org>
 <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org>
 <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
 <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
 <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
 <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
 <CABb+yY3W3Cv7a6wZhvJe80xn5sp1Y_A_nbY_=cj0U4Z1YC61vw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY3W3Cv7a6wZhvJe80xn5sp1Y_A_nbY_=cj0U4Z1YC61vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jassi,

Sorry for the late reply, I was off for a while.

On 10/29/24 3:59 PM, Jassi Brar wrote:
>>> If your usecase is not currently handled, please let me know. We can
>>> discuss that.
>> It's not handled. I have a list of requirements I have to fulfill which
>> are not covered by the mailbox core:
>>
>> 1/ allow multiple TX in-flight. We need to let the controller handle its
>> hardware queue, otherwise the hardware queue has no sense at all.
>>
> As I said this one is currently handled by assuming TX-done by
> depositing in the h/w queue/fifo.

This may work indeed. I would have a TXDONE_BY_ACK controller. Its
`.send_data` would be a one liner, where I just raise the interrupt to
the firmware. TX ring would be written by `cl->tx_prepare()`.

Then in the protocol driver I would do:
ret = mbox_send_message(mbox_chan, msg);
if (ret < 0)
	return ret;

/* TX-done when depositing in the h/w queue. */
mbox_client_txdone(mbox_chan, 0);

ret = exynos_acpm_wait_for_message_response(mbox_chan, msg);
if (ret)
	return ret;

> You will have the same perf as with your attempt to have "multiple

I'm still forced to pass all the messages to the mailbox's core software
queue. I also don't need the locking from the core. For my case the mbox
core just needs to do:

if (chan->cl->tx_prepare)
	chan->cl->tx_prepare(chan->cl, data);

return chan->mbox->ops->send_data(chan, data);

Would it make sense to introduce such a method?

BTW, what are the minimum requirements for a controller to be considered
a mailbox controller? As you saw, I'm using the mailbox controller just
to raise the interrupt to the firmware, no messages are written to the
controller's buffers.

Does message size matter? On my device the ACPM protocol is using
messages of 0, 2, 16 or 32 bytes, but it also allows the possibility to
pass a pointer to an indirection command SRAM buffer, where one is able
to write up to 412 bytes.

> in-flight" while neither of these approaches handles in-flight
> failures. We can discuss this.

Do you mean that there's no retry mechanism? The crypto subsystem has
one, we may look at what's done there if we care.

> 
>> 2/ allow to tie a TX to a RX. I need to know to what TX the response
>> corresponds to.
>> 3/ allow multiple clients to the same channel. ACPM allows this. Support
>> would have come as an extra patch.
>>
> These are nothing new. A few other platforms too have shared channels
> and that is implemented above the mailbox.
> 
okay

>> 4/ allow polling and IRQ channels for the same mailbox controller (not
>> urgent).
>>
> It is very easy to populate them as separate controllers.

Do you mean to call devm_mbox_controller_register() twice for the same dev?

Thanks,
ta
