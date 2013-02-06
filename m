From: Yuvaraj Kumar <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] i2c: Providing hooks for i2c multimaster bus arbitration.
Date: Wed, 6 Feb 2013 10:58:56 +0530
Message-ID: <CAKuRcOKx4VLcmhwi8VWHKNOizgiVsE5f0v-CGmK5+bH=BjJAPg@mail.gmail.com>
References: <1359968595-21291-1-git-send-email-yuvaraj.cd@samsung.com>
	<CAD=FV=VQywwQ3YAFb=1qFmd3UEW39Xu=ok6fdjhvBXdwOQOa1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VQywwQ3YAFb=1qFmd3UEW39Xu=ok6fdjhvBXdwOQOa1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, naveen krishna <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 6, 2013 at 5:48 AM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Yavaraj,
>
> On Mon, Feb 4, 2013 at 1:03 AM, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>>
>> This RFC patch is w.r.t multimaster bus arbitration which is already
>> being discussing in the mainline.
>> This patch provides hooks for the i2c multimaster bus arbitration
>> and to have the arbitration parameters.
>
>
> I may have missed something in all the threads, but my recollection was that
> the request was that this should be implemented without touching the i2c
> core code.  Your patch modifies the i2c core code.
   Different i2c devices will directly talk to i2c core using i2c_transfer().
   If we put this out of the i2c core,the i2c devices like tpsxxxx and etc
   should be registered through the bridge/mux .
>
> My impression was that the best solution was to use the infrastructure in
> place for i2c multiplexing.  ...but in your case you would only multiplex
> one thing.  This was suggested by Grant Likely and seems the cleanest...
   I agree that Grants idea was the cleanest but we may end up in change in

>
> -Doug
