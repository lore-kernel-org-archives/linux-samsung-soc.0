From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Wed, 08 Jan 2014 08:31:38 -0800
Message-ID: <20140108163138.27803.58310@quantum>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
 <20131231194215.12054.39705@quantum> <2890647.PEOApIOYyP@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2890647.PEOApIOYyP@amdc1227>
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

Quoting Tomasz Figa (2014-01-02 07:22:12)
> On Tuesday 31 of December 2013 11:42:15 Mike Turquette wrote:
> > Quoting Tomasz Figa (2013-12-12 08:07:13)
> > > This series intends to improve clock provider impementation of max77686
> > > PMIC driver. First two patches are simple fixes of current implementation
> > > to allow correct control of provided clocks. Further patches refactor
> > > the driver to make the code cleaner and prepare for further patches. Then
> > > last two patches add registration of OF clock provider and adjust device
> > > tree nodes of boards containing max77686 chip to contain properties
> > > required by clock provider.
> > 
> > Acked-by: Mike Turquette <mturquette@linaro.org>
> 
> Hmm... Shouldn't this series go through the clk tree directly? If not, who
> should be taking it?

Yes it should, but I guessed it would come in a pull request. Maybe Ack
is the wrong thing? I can just say "looks good to me me" or something
else.

Regards,
Mike

> 
> Best regards,
> Tomasz
> 
