From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Wed, 08 Jan 2014 13:54:32 -0800
Message-ID: <20140108215432.27803.3120@quantum>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
 <20140108171544.GC14575@lee--X1> <20140108175939.27803.30462@quantum>
 <4160932.uvjJSNcuKL@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4160932.uvjJSNcuKL@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2014-01-08 10:04:57)
> On Wednesday 08 of January 2014 09:59:39 Mike Turquette wrote:
> > Quoting Lee Jones (2014-01-08 09:15:44)
> > > > I believe Lee has already applied this one, but in future, to avoid such
> > > > confusion, if it's more convenient for you, I can send you any clock
> > > > series as pull requests.
> > > 
> > > Me? I haven't applied any clk patches.
> > 
> > I have taken patches 1-7 into clk-next just now.
> 
> Thanks.
> 
> > I can take patch #8 as
> > well but it would probably be better to send it through arm-soc?
> 
> Hmm, patch 8 is trivial enough to not cause any merge conflicts, but since
> it's unlikely that any users depending on introduced changes will show up
> for 3.14 it shouldn't really matter which tree it goes through...

In the absence of any strong opinion on the topic I have taken patch #8
into clk-next for 3.14.

Regards,
Mike

> 
> Best regards,
> Tomasz
> 
