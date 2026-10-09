Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5544C65C;
	Fri,  9 Oct 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527802; cv=none; b=GWbGc1OYqUUUGe+XPqXVTnM7/roCKQJ9OsrbvaUx76EBMrNNDGUSUaXm92iG1ZNba+sE3XpSAr7u7C7f53SOTXww2DE7nzAf/zJRbaAQzPkPIymE3TcZ7nMstPb8JVz3tAYIAU43vxVFOpu+yA3hn3Q2M879OKoUTJykoJ6Ke6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527802; c=relaxed/simple;
	bh=6a2jpBbdVOpf7H3trgEc/tTYPOnCEArKj8r/5oWzDvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6VLwPoqiofhAB2ImTZXwykU3A/himRRGB5Di0mbQEAP84S63mThpJiGQXvzEznMVFt0AtT1OxagBVGfWDEKHos+2Txd7OoONLJ9zhTaqzLFuaR4lYKOswTDRWaNsVzwYON54E8YSK03oUJnaAkyDwxwkYEy9mFinAKZ8uJlX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1XutQIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1XutQIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A391F000FF;
	Fri,  9 Oct 2026 06:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791527800;
	bh=jx7npCcUuAQgxbfc2Agr3M33C2GZC5MXa2bHNjH9XTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V1XutQIpwwz5mwiG+zyoqyRx7m/dK2w1SNaRrVRJtlkY6r3AiFeSGSiykYCVe0ebY
	 FuGrYGTsfUbrskqt3mmQz1oGnB9atvvwzruHWZb8BAFvTjhXbZLFIvQV+VNRMtl7FC
	 gIQPi62qowHListw8Ht27F0wBc+Z2DAkoFuM5DQX5KNpnGhXVpnM6JfZWZxZJ4QOMM
	 TFWhdFEtfoQdkFHE8auH52gS199INNOv3pqZPN+RjOJJtXq2m/BB9c7QgNHACDlVwn
	 dB5v4TM0q+Blf4KWD7zOTXNFV1QGVlhKiCehkTPVSY8KNKDtDEPJnjljpta/9Uqtnz
	 ZQn1eKEe5Ho0Q==
Message-ID: <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
Date: Fri, 9 Oct 2026 08:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox
 driver
To: Doug Anderson <dianders@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>,
 Subhash Jadavani <sjadavani@google.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>,
 Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2026 23:34, Doug Anderson wrote:
> 
> ```C
> static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox,
>                                       const struct fwnode_reference_args *sp)
> {
>   int i;
> 
>   if (sp->nargs)
>     return ERR_PTR(-EINVAL);
> 
>   for (i = 0; i < mbox->num_chans; i++) {
>     if (!mbox->chans[i].cl)
>       return &mbox->chans[i];
>   }
> 
>   return ERR_PTR(-EBUSY);
> }
> ```
> 
> Then the client loops around and requests the same channel over and
> over again until it gets -EBUSY? Like:
> 
> ```C
> for (i = 0; i < FIFO_MAX; i++) {
>   client
>   chan[i] = mbox_request_channel(client[i], TX_CHAN);
>   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) == -EBUSY)
>     break;
> }
> fifo_depth = i;
> ```
> 
> I _guess_ that works, but it still feels like a bit of a hack to me.
> You said you were worried about people abusing the "has_queue" API.
> The above feels like it's abusing the "fw_xlate" API, turning it from
> something that is normally a "lookup" into an allocator function.
> 
> +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
> something that looks right to you?

There is no allocation in your xlate code above, so this is not that
terrible as we talked on LPC.

> 
> 
> I researched whether other upstream drivers use of_xlate() /
> fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> which appears to be doing something similar. However, upon deeper
> digging it seems like "exynos-mailbox" isn't using this dynamic
> allocation for any compelling reason. It looks like, really,
> "exynos-mailbox" should just be returning one channel. The client
> (exynos-acpm) could just use the same channel for everything since:
> * It actually gets the _real_ channel ID out of the data.
> * It doesn't care about txdone.
> * All it does is ring a doorbell and there's no queueing.
> 
> 
> In any case, if using fw_xlate() as an allocator is truly the only way
> to proceed, I'll finish my prototype and send a v2, but I'm still

Why fw_xlate() would be an allocator? Can you extend your code to show that?

I think doing any allocation in xlate() is calls is fundamentally wrong.
These should not modify the state of the device, so no allocations, no
device_link_add() etc.

Why? There is simply no corresponding xlate_destroy() call. It's also
confusing, because the meaning is to translate from one domain resource
to another, not perform actual resource allocation.

> skeptical that this is better than just adding queuing into the core.
> Speaking of which, I actually want to go back to something you said
> earlier. I asked a bit about this but I don't think I saw a response
> (sorry if I missed it!):

Best regards,
Krzysztof
