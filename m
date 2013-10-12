From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH RFC 5/7] mx2-emmaprp: Use mem-to-mem ioctl helpers
Date: Sat, 12 Oct 2013 13:11:13 +0200
Message-ID: <52592E51.90709@gmail.com>
References: <1379076986-10446-1-git-send-email-s.nawrocki@samsung.com> <1379076986-10446-6-git-send-email-s.nawrocki@samsung.com> <524948CB.8010807@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <524948CB.8010807@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, kyungmin.park@samsung.com, pawel@osciak.com, javier.martin@vista-silicon.com, m.szyprowski@samsung.com, shaik.ameer@samsung.com, arun.kk@samsung.com, k.debski@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/30/2013 11:47 AM, Hans Verkuil wrote:
> On 09/13/2013 02:56 PM, Sylwester Nawrocki wrote:
[...]
>> @@ -812,6 +753,7 @@ static int emmaprp_open(struct file *file)
>>   		kfree(ctx);
>>   		return ret;
>>   	}
>> +	/* TODO: Assign fh->m2m_ctx, needs conversion to struct v4l2_fh first */
>
> What's the point of adding this patch if it won't work yet?

Sorry, I shouldn't have included that commit in this series yet, that's my
oversight. And it didn't prove a good way to draw people's attention to
this RFC series either. ;)
Nevertheless, I have already written the missing patch and will be sending
v2 of this series shortly.

--
Thanks,
Sylwester
