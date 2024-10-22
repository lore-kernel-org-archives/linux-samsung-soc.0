Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0519D063
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Oct 2024 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729603623; cv=none; b=MXrlrdIuB8gGSDNn+JUTUg6gxXzELeR70NCtHyWTv51+1ZR/WYXqCuOCAkIFKlF+BxBmLhss94BpD8KENSr9h0Sa9Y/TGI7aRyfyBmmQufSNf9IxnxWfwbGwdSsIBtKUAAiFQjwacgP0O0YENz7iJXhB+1n/yPFnxe68GfqHHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729603623; c=relaxed/simple;
	bh=GMSgEW7Tyi2Ycn088qm8LQGRdQiaWvV2et2V0iZk2Ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsQBxit5GtAlaEbJcE4mUpQ2PRNFMpQW8qQWDUY9gmADYG61b559Wrq5w36ok3TZaPmMvKazBSQ1LHTh3+VZfXBYWesNFtsO+ko0MZ/rZ6AdJhixEEBkHCrEvzzzGy1COlNnBsW37joqeT7LzrqRl/3qAUfYU8cLJzb8nfDkDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLWTQdWt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLWTQdWt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314c452180so44448625e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Oct 2024 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729603620; x=1730208420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEROK7pCSLjSAGRH/qjAy3fYuYLwmgPcB6kpQVXty5w=;
        b=mLWTQdWtm8gcJOUG0sQ/OE3xIcK4Nc4yNqzqimXilbmEY283hndachsUQewb2dMQ4k
         g+SbJpn9wN/Ck/jve6ssiX6Yh4geCEuBoXMCUG/mLXgp/XA0VSZIxBcD78QzLw+HlEty
         U8ma+5m6qyxsuWINVIV5Nf7uQOEjCHJEF1d/4ScN1ClBnTDwi1EtaXwp62VnuMJzYHmk
         51HPmnrXoTe5fEhnPtPTkkPoxW+9ns+vx6meb5w89dix9rVMESeuccx9gNW75Gl2k1cr
         aG/LbLFjNyHj5RZ4gFQZHMpMpdPxilaAuk1xxSZ73GHDAY7cj5o5seSi0riRdORstwrl
         vBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729603620; x=1730208420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEROK7pCSLjSAGRH/qjAy3fYuYLwmgPcB6kpQVXty5w=;
        b=HHFTOdPEtKm+i8kLeasItHFZR9OzLE6FC51Mgv0Mxpt4BuD0pMwzrCIkyukojhpWJm
         FsJowus5cq0YTNPsY/tl+RqhaoRiw58s2rlwcBrDsu8ya/pXpSJY8HROdeqo6g9LhANC
         ZOoIhFesD+t0EycOYERYeFWW7OeRPBELq4zRFWcyJLyAgIcZxWoAKBxIa6xkqB0rZZmg
         9MnL03VjtU5Ez9184qYJclrjIcblF0GxARgY8zDVFaCpHGzs3t5mvhVDxzali2STX20D
         V4l5Vae9jQvvzlkMby9Q5m8crlPhzHkLQSa04j8iBm4hFSarQj1+yrf66LF3PbGaGed0
         DgRA==
X-Forwarded-Encrypted: i=1; AJvYcCUtDlHyx9hHe9PoczWXYLl/HlU3ci1Qorxd/JB15vzdX/1+BcE8M+SJSLNXA4uNNMAFYqWzqUQvVyzQqB5zUPlKTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHvsl2y/0w776Z/+pZkgm3NmC3TReDoqdrR2W42q9qTmW7pwdE
	I0tvJ5I9al3Kxo0Zmpf+0ZZ7kzRAhfvzfjDoAlovgf/b/k2wUrHdePEasuOQX6U=
X-Google-Smtp-Source: AGHT+IGKxptddgZTqrPTJ9ZkLdCpniWZtMR9qnq+LHRGeiHCCnC8+t+eEpHxg5yn6pTcNuSGzLkDvw==
X-Received: by 2002:adf:a184:0:b0:37d:3baa:9f34 with SMTP id ffacd0b85a97d-37ef1262743mr2327999f8f.1.1729603619815;
        Tue, 22 Oct 2024 06:26:59 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:9203:6000:5b64:2b7c:edff:1f7a? ([2a02:2f04:9203:6000:5b64:2b7c:edff:1f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0ba74dbsm6631867f8f.112.2024.10.22.06.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 06:26:59 -0700 (PDT)
Message-ID: <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
Date: Tue, 22 Oct 2024 14:26:56 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jassi,

On 10/21/24 5:32 PM, Jassi Brar wrote:
>> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
> 
>> The active request is considered completed when TX completes. But it seems
>> that TX is not in direct relation with RX,
> 
> TX and RX are assumed independent operations (which they are).
> TX is sending a message/request to the remote successfully. 'Success'
> can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
> ACK}.
> You seem to assume it should always be an ACK where we receive an
> acknowledgment/response packet, which is not the case.

My controller driver indeed ties TX to RX and considers the request
completed when the RX completes.

But other drivers can still complete the request at TXDONE if that's
what they need.

> 
> ...
> 
>>> Correct, and it is not meant to be.
>>> You are assuming there is always an RX in response to a TX, which is
> 
>> Not really. If there's no response expected, clients can set req->rx to NULL.
> 
> You are assuming the default behaviour is that there is a reply
> associated with a TX, otherwise "clients can set req->rx to NULL".
> This api can be _used_ only for protocols that expect a response for
> each TX. For other protocols,  it is simply a passthrough wrapper (by
> doing things like req->rx = NULL). For handling this special case of
> Tx->Rx, maybe a higher level common helper function would be better.
> 
> ...
> 
>>> reasons, it is left to the user to tie an incoming RX to some previous
>>> TX, or not.
> 
>> Is there a specific driver that I can look at in order to understand the
>> case where RX is not tied to TX?
> 
>  Many...
>  * The remote end owns sensors and can asynchronously send, say
> thermal, notifications to Linux.
>  * On some platform the RX may be asynchronous, that is sent later
> with some identifying tag of the past TX.
>  * Just reverse the roles of local and remote - remote sends us a
> request (RX for us) and we are supposed to send a response (TX).

I was hoping for a name of a driver, but I guess I can find them out
eventually.
> 
>> Also, if you think there's a better way to enable controllers to manage
>> their hardware queues, please say.
>>
> Tying RX to TX has nothing to do with hardware queues. There can be a

Right, I agree.

> hardware queue and the protocol can still be
> "local-to-remote-broadcast".
> 
> While I don't think we need the "Rx is in relation to some past Tx"
> api, I am open to ideas to better utilize h/w queues.
> 
> The h/w TX queue/fifo may hold, say, 8 messages while the controller
> transmits them to the remote. Currently it is implemented by
> .last_tx_done() returning true as long as fifo is not full.
> The other option, to have more than one TX in-flight, only complicates
> the mailbox api without fetching any real benefits because the
> protocol would still need to handle cases like Tx was successful but
> the remote rejected the request or the Rx failed on the h/w fifo
> (there could be rx-fifo too, right). Is where I am at right now.
> 
No worries, I'm confident we'll reach a conclusion.

It's true I implemented just my use case, but that doesn't mean that the
"request" approach can't be extended for current users.

If we replace throughout the mailbox core `void *message` with
`struct mbox_request *req`, all the users can still do their magic,
isn't it? The only difference would be that instead of having a
completion structure per channel, we have a completion structure per
request.

In order to have more than one TX in-flight, we need that each TX to
have its own completion struct. Then, for my case, if the clients expect
a response for each TX, then it shall be the responsibility of the
client to allocate space for RX. This is exactly what struct
mbox_request does:

+struct mbox_wait {
+	struct completion completion;
+	int err;
+};
+
+#define DECLARE_MBOX_WAIT(_wait) \
+	struct mbox_wait _wait = { \
+		COMPLETION_INITIALIZER_ONSTACK((_wait).completion), 0 }
+
+#define MBOX_REQ_MAY_SLEEP	BIT(0)
+
+struct mbox_request {
+	struct mbox_wait *wait;
+	void *tx;
+	void *rx;
+	unsigned int txlen;
+	unsigned int rxlen;
+	u32 flags;
+};

Also, in order to have more than one TX in-flight, we need to allow
controller drivers to bypass the mailbox core
one-active-request-at-a-time handling. The current software queue
handling mechanism from the mailbox core can be used as a backlog
mechanism: if the controller driver has no space to process a new
request (regardless if it has hardware queue or not), it can fallback to
the backlog mechanism where one request is handled at a time. The use of
the backlog mechanism shall be an opt-in choice.

Now clients that don't care about RX are allowed to not allocate space
for it, and consider the request completed at TX done, if that's what
they need.

What am I missing?

Thanks,
ta
