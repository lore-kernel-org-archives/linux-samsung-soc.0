From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] [media] s5p-mfc: Add Horizontal and Vertical search range
 for Video Macro Blocks
Date: Thu, 23 Jan 2014 11:21:04 +0100
Message-ID: <52E0ED10.2020901@samsung.com>
References: <1388400186-22045-1-git-send-email-amit.grover@samsung.com>
 <019f01cf1823$7e020fa0$7a062ee0$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <019f01cf1823$7e020fa0$7a062ee0$%debski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: 'Amit Grover' <amit.grover@samsung.com>, m.chehab@samsung.com, linux-media@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob@landley.net, kyungmin.park@samsung.com, jtp.park@samsung.com
Cc: Kamil Debski <k.debski@samsung.com>, hans.verkuil@cisco.com, andrew.smirnov@gmail.com, arun.kk@samsung.com, anatol.pomozov@gmail.com, jmccrohan@gmail.com, austin.lobo@samsung.com, 'Swami Nathan' <swaminath.p@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 23/01/14 11:11, Kamil Debski wrote:
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
>> > b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
>> > index 4ff3b6c..a02e7b8 100644
>> > --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
>> > +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
>> > @@ -208,6 +208,24 @@ static struct mfc_control controls[] = {
>> >  		.default_value = 0,
>> >  	},
>> >  	{
>> > +		.id = V4L2_CID_MPEG_VIDEO_HORZ_SEARCH_RANGE,
>> > +		.type = V4L2_CTRL_TYPE_INTEGER,
>> > +		.name = "horizontal search range of video macro block",
>
> This too should be property capitalised. Please mention the motion vectors
> too. 

And additionally length of the name string should not exceed 31 characters.

--
Thanks,
Sylwester
